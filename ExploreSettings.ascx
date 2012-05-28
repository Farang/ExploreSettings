﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExploreSettings.ascx.cs" Inherits="ExploreSettings.ExploreSettings" %>
<asp:Panel runat="server" ID="ScopeWrapper">
    <div>
        Host Settings
        <ul id="hostSettings" />
    </div>
    <div>
        Portal Settings
        <ul id="portalSettings" />
    </div>
</asp:Panel>
<script type="text/javascript">
    $(document).ready(function () {
        var self = this;
        var moduleScope = $('#<%=ScopeWrapper.ClientID %>');
        var sf = $.ServicesFramework(<%=ModuleId %>);

        self.htmlEncode = function(value) {
            return $('<div/>').text(value).html();
        };

        $.ajax({
            type: "GET",
            url: sf.getServiceRoot('ExploreSettings') + "Settings.ashx/HostSettings",
            data: '',
            beforeSend: sf.setModuleHeaders,
            error: function (xhr, status, error) {
                alert(error);
            }
        }).done(function (data) {
            if(data !== undefined && data != null) {
                var s = "";
                for(key in data) {
                    s += "<li>" + self.htmlEncode(key) + ":" + self.htmlEncode(data[key]) + "</li>";
                }
                $("#hostSettings", moduleScope).append(s);
            }
        });

    })
</script>
#!/usr/bin/haserl
<%
	# This program is copyright Â© 2008-2013 Eric Bishop and is distributed under the terms of the GNU GPL
	# version 2.0 with a special clarification/exception that permits adapting the program to
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL.
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" -t $(uci get gargoyle.global.session_timeout) -b "$COOKIE_browser_time"  )
	gargoyle_header_footer -h -s "status" -p "wireguard_connections" -j "wireguard_connections.js table.js" -z "wireguard.js" wireguard_gargoyle
%>

<script>
var statusFileLines = []

<%

wg show | awk '{print "statusFileLines.push(\""$0"\");" ; }'

%>
</script>

<h1 class="page-header"><%~ wireguard.ConnWgC %></h1>
<div class="row">
	<div id="openvpn_server_fieldset" class="col-lg-6">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h3 class="panel-title"><%~ wireguard.ConnWgC %></h3>
			</div>

			<div class="panel-body">
				<div id="wireguard_connection_table_container"></div>
			</div>
		</div>
	</div>
</div>

<script>
	resetData()
</script>

<%
	gargoyle_header_footer -f -s "status" -p "wireguard_connections"
%>


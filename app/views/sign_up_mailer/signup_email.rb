<!DOCTYPE html>
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
  </head>
  <body>
    <p>
      Someone Signed Up
    </p>
		<p>
			  Name: <%= @sign_up['name'] %>
		</p>
		
		<p>
			  Email: <%= @sign_up['email'] %>
		</p>
		
		<p>
			  Phone: <%= @sign_up['phone'] %>
		</p>
		
		<p>
			  Organization: <%= @sign_up['organization'] %>
		</p>
		<% if  @sign_up['currrent_site'] %>
		<p>
			  Website: <%= @sign_up['currrent_site'] %>
		</p>
		<% end %>
		<p>
			  Plan: <%= @sign_up['plan'] %>
		</p>
		<% if @sign_up['deadline'] %>
		<p>
			  Deadline: <%= @sign_up['deadline'] %>
		</p>
		<% end %>
		<p>
			  Organization Information: <%= @sign_up['information'] %>
		</p>
		<% if @sign_up['additional'] %>
		<p>
			  Additional Information: <%= @sign_up['additional'] %>
		</p>
		<% end %>
	</body>
</html>

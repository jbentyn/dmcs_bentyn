<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main" />
<title>Welcome to Grails</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

.ie6 #status {
	display: inline;
	/* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div id="status" role="complementary">
		<h1>MENU</h1>
		<ul>
			<li><g:link controller="employee">Employee list</g:link></li>
		</ul>

	</div>
	<div id="page-body" role="main">
		<h1>Welcome to Grails</h1>
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut a vehicula quam, vel efficitur lacus. Cras ut congue quam. Nulla venenatis sapien
			ac tortor eleifend congue. Duis lacinia at felis blandit convallis. Sed faucibus nisl ante, in faucibus nisl maximus sit amet. Vivamus at risus
			diam. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse vitae neque gravida, dignissim libero
			vitae, maximus metus. Sed a rhoncus leo, non luctus nunc. Sed in turpis vitae dui commodo placerat sit amet nec odio.</p>
		<p>Vivamus sodales eleifend congue. Donec sapien odio, mattis eu lacus eleifend, sagittis mollis est. Maecenas egestas, diam id convallis
			tempor, sem nisl tempus urna, egestas porttitor neque quam eu turpis. Aliquam condimentum lectus sit amet elit vulputate, quis porta nisi dictum.
			Etiam elit felis, efficitur eget auctor sit amet, ultrices eu nunc. Etiam luctus lacus vitae accumsan luctus. Vivamus egestas commodo massa a
			lacinia. Aliquam non turpis feugiat, iaculis nisi vel, finibus velit. Sed lectus dui, aliquet eget metus eu, aliquam fermentum justo. Donec ac
			tristique nibh, ut porttitor dui.</p>
		<p>Proin id augue augue. Sed sapien lacus, ullamcorper et ornare nec, ullamcorper non orci. Phasellus nulla libero, pharetra eget turpis vel,
			ullamcorper finibus metus. Fusce varius laoreet arcu, nec tincidunt diam lobortis ac. Nullam suscipit, quam sagittis tincidunt bibendum, mauris
			orci mollis purus, eget euismod metus tellus ac nisl. Pellentesque pretium, est vel vulputate faucibus, eros mi tristique risus, ac pellentesque
			libero nulla in erat. Sed sed varius diam. Morbi ac nibh a lectus luctus volutpat. Fusce sed augue libero. Duis dapibus fermentum quam a malesuada.
			Aenean tincidunt elit quis odio maximus, id cursus erat molestie. Integer eget ornare nulla, quis blandit massa. Sed finibus pellentesque turpis
			quis mattis. Quisque sed auctor turpis. Morbi vitae sodales justo. Curabitur rutrum, massa ut feugiat placerat, orci sem venenatis velit, et
			eleifend tellus massa vel neque.</p>
	


	</div>
</body>
</html>

﻿<cfoutput>#html.doctype()#<html lang="en"><head>	<meta charset="utf-8">	<title>Welcome to ContentBox!</title>	<meta name="description" content="ContentBox Application Template">    <meta name="author" content="Ortus Solutions, Corp">	<!---Base URL --->	<base href="#getSetting("HTMLBaseURL")#" /></head><body data-spy="scroll">	#renderView()#</body></html></cfoutput>
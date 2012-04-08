# cf-basis Environment Plugin

A environment switching component for the CF-Basis framework.

### Usage
Copy the **environment** directory and its contents into your Basis **plugins** folder. The folder for plugins is named plugins by default unless you have customized it in your application.

Once copied reload your application and Basis will pick it up automatically and register it as a new application variable object called *env*.

Basis is a ColdFusion MVC framework, which can be found at https://github.com/adampresley/cf-basis.

Inside the environment directory is a configuration file named **environmentConfig.txt**. The default file looks like this:

    [
		{ "name": "Dev", "pattern": "(.*?)(\.*)dev(\.*)(.*?)" },
		{ "name": "Dev", "pattern": "localhost" },
		{ "name": "Dev", "pattern": "127.0.0.1" },
		{ "name": "Test", "pattern": "(.*?)(\.*)test(\.*)(.*?)" },
		{ "name": "Staging", "pattern": "(.*?)(\.*)stage(\.*)(.*?)" },
		{ "name": "Prod", "pattern": "(.*?)\.net" },
		{ "name": "Prod", "pattern": "(.*?)\.com" },
		{ "name": "Prod", "pattern": "(.*?)(\.*)prod(\.*)(.*?)" }
	]

You'll notice that it's a JSON string. Coldfusion parses this string and checks all of the regexs against the Coldfusion CGI variable server_name.

Example:

    <!--- Display the current environment --->
    <cfoutput>#application.env.getCurrentEnv()#</cfoutput>

### License
Copyright 2012 Jesse Roach. All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY Jesse Roach "AS IS" AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO
EVENT SHALL Jesse Roach OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
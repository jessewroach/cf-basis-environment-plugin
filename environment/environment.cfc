<cfcomponent extends="Basis.Plugin" output="false">

	<cffunction name="initPlugin" output="false">
		<cfset this.name = "Environment" />
		<cfset this.scope = "application" />
		<cfset this.referenceName = "env" />
		<cfset determineEnvironment() />
		
	</cffunction>

	<cffunction name="determineEnvironment" access="private" output="false">
		
		<!--- var scope the local variables --->
		<cfset var envConfig = "" />
		<cfset var envArray = [] />
		<cfset var item = "" />
		
		<!--- The environment will default to Prod if there are no config options --->
		<cfset variables.currentEnv = "Prod" />
		<!--- Read in the config file. It resides in the same directory as this component --->
		<cffile action="read" file="#getDirectoryFromPath(getCurrentTemplatePath())#environmentConfig.txt" variable="envConfig" />
		
		<!--- Deserialize the JSON from the config file --->
		<cfset envArray = deserializeJSON(envConfig) />
		
		<!--- Check the array length...if empty default the environment to Prod --->
		<cfif arrayLen(envArray)>
			<!--- Loop the array and check the regexs --->
			<cfloop array="#envArray#" index="item">

				<cfif reFindNoCase(item.pattern, CGI.server_name)>
					<cfset variables.currentEnv = item.name />
					<cfbreak />
				</cfif>

			</cfloop>
		</cfif>
		
	</cffunction>

	<cffunction name="getCurrentEnv" access="public" output="false">
		<cfreturn variables.currentEnv />
	</cffunction>
	
</cfcomponent>

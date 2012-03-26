<cfcomponent extends="Basis.Plugin" output="false">

	<cffunction name="initPlugin" output="false">
		<cfset this.name = "Environment" />
		<cfset this.scope = "application" />
		<cfset this.referenceName = "env" />
		<cfset determineEnvironment() />
		
	</cffunction>

	<cffunction name="determineEnvironment" access="private" output="false">
		<cfif CGI.server_name CONTAINS "localhost">
			<cfset variables.currentEnv = "Dev" />
		<cfelse>
			<cfset variables.currentEnv = "Prod" />
		</cfif>
	</cffunction>

	<cffunction name="getCurrentEnv" access="public" output="false">
		<cfreturn variables.currentEnv />
	</cffunction>
	
</cfcomponent>

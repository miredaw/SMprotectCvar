#include <sourcemod>

#pragma semicolon 1
#pragma tabsize 0

public Plugin myinfo = {
    name = "Protect Cvars From Game Monitors",
    author = "Mireda",
    description = "Protect Cvars From Game Monitors [ Mireda.ir ]",
    version = "1",
    url = "Mireda.app"
};

public void OnPluginStart()
{

	

	Handle iter;
	char buffer[256];
	int flags;
	bool isCommand;


	iter = FindFirstConCommand(buffer, sizeof(buffer), isCommand, flags);
	
	do
	{
		if (!isCommand)
		{
		
		 Handle cvars = FindConVar(buffer);
		
					flags &= ~FCVAR_NOTIFY;
					SetConVarFlags(cvars, flags);
		/*
			if( StrContains(buffer,"sourcemod_version",false) == -1 ){
			
					flags &= ~FCVAR_NOTIFY;
					SetConVarFlags(cvars, flags);
			}
		*/

		
		}
	}
	while (FindNextConCommand(iter, buffer, sizeof(buffer), isCommand, flags));


	CloseHandle(iter);


}




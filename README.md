# OCSR
Hayden Vass
P51905
Alpha Build

Read Me:

Orange Country Surf Report is a dynamic way for surfers to check the surf conditions in, as the name suggest, Orange County California. In its current state, the applications primary functionality is complete. This means that users can quickly and easily gain a general idea of how surf conditions are in the Pacific Ocean, relative to Orange County. Users are able to get data about swell size, ocean temperature as well as tide and wind conditions. This is done by simply using the respective button to view the desired data. While this feature is complete, it is worth mentioning that the initial API call to each data set seems to lagged. Upon viewing the logs, the initial call results in an error, then tries again and works. Supplementary calls afterward fire off with little to no down time. This is true for each data set as they all have an unique API call. 

Another thing to note about the applications current state is the prepared functionality for the upcoming version. Users will see a button labeled “Spot Forecast”. This button has been placed in the UI simply for the ease of continuing the build into its final phase. It currently has no functionality. The proposed purpose of this button is to allow users to ability to check the conditions of individual surfing spots along the coast adjacent to Orange County. While the primary functionally gives users a broad over view the surf conditions, this feature will allow users to get a quick description of the conditions at their desired beaches and is intended to work alongside the phone as well.  If time permits I would like the phone to implement a map feature so the user can press spot forecast on the wearable, and be presented a list of nearby beaches of which they can view the forecast. 

Outline:

Known bugs / upcoming changes:
-	Initial API calls are slow. This is true for each data set as they all touch different APIS.
-	Some data is contained in a double, resulting in numbers too long to present. Numbers will eventually be rounded to a more reasonable length.
-	If ocean sensors return null data for any reason, a default value of 0 is presented to the user. In the final build, more appropriate data will be returned to the user. 
-	Phone layout is currently a place holder until a final implementation is figured out. 
-	Surf spot functionality will be implemented into final build.

Tested Devices: 

-	iPhone Xs Max with Apple Watch series 4 – 44 mm.

Other things to note:
-	Initial repo accidentally got deleted, so current repo is a few days behind of the actual work load.
Repo:
-	https://github.com/HaydenVass/OCSR


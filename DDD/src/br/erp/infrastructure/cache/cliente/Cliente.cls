Class Cliente As %Persistent 
{
    Property UID As %String;

    Property nome As %String;

    Index IndexUnique On UID [ Unique ];
}
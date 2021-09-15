package fr.paris.lutece.plugins.genericattributes.service.anonymization;

import java.util.Locale;

import fr.paris.lutece.portal.service.i18n.I18nService;

public class EntryAnonymizationType implements IEntryAnonymizationType
{
    private String _wildcard;
    private String _helpKey;
    
    /**
     * Constructor
     * @param wildcard
     * @param helpKey
     */
    public EntryAnonymizationType( String wildcard, String helpKey )
    {
        super( );
        _wildcard = wildcard;
        _helpKey = helpKey;
    }
    
    /**
     * @return the wildcard
     */
    public String getWildcard( )
    {
        return _wildcard;
    }

    /**
     * @return the helpKey
     */
    public String getHelpKey( )
    {
        return _helpKey;
    }

    @Override
    public String getHelpMessage( Locale locale )
    {
        return getWildcard( ) + " " + I18nService.getLocalizedString( getHelpKey(), locale );
    }
}
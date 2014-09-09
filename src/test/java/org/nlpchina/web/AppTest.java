package org.nlpchina.web;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * Unit test for simple App.
 */
public class AppTest 
    extends TestCase
{
    /**
     * Create the test case
     *
     * @param testName name of the test case
     */
    public AppTest( String testName )
    {
        super( testName );
    }

    /**
     * @return the suite of tests being tested
     */
    public static Test suite()
    {
        return new TestSuite( AppTest.class );
        //insert into user_ifo(id,user_type,site_type,site_id,url,name,access_token,update_time,register_time,location,description,profile_image_url,user_domain,gender,avatar_large) values(1,1,'dd','dd','dd','admin','dd','2014-06-09 18:39:47','2014-06-09 18:39:47','dd','dd','dd','dd','dd','dd') ;

    }

    /**
     * Rigourous Test :-)
     */
    public void testApp()
    {
        assertTrue( true );
    }
}

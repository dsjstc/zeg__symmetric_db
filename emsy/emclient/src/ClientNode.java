import org.apache.log4j.helpers.Loader;
import org.apache.log4j.helpers.OptionConverter;
import org.jumpmind.symmetric.ClientSymmetricEngine;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.Properties;

// Very loosely adapted from
// http://stackoverflow.com/questions/34069278/create-sym-tables-in-symmetricds-embedded

public class ClientNode {
    private ClientSymmetricEngine cEngine;
    private File propFile;

    public static void main(String[] args) {

        URL l4jcf = getLog4jConfig();
        if( l4jcf != null ) System.out.println( "Log4j using " + l4jcf.toString());

        try {
            ClientNode cnode = new ClientNode(new File("conf/emclient.properties"));

            Thread.sleep(3000);
            cnode.getcEngine().stop();
            cnode.getcEngine().start();
            Thread.sleep(5000);

        }catch (Exception e) {
            e.printStackTrace();
        }
    }


    public ClientNode(File file) throws FileNotFoundException, IOException {
        propFile = file;
        Properties propertiesFile = new Properties();
        propertiesFile.load(new FileReader(propFile));
        cEngine = new ClientSymmetricEngine(propertiesFile, true);
        getcEngine().setup();
        String nodeGroupId =  propertiesFile.getProperty("group.id"); // Not sure what happens if these conflict.
        String externalId = propertiesFile.getProperty("external.id");
        getcEngine().openRegistration(nodeGroupId, externalId);
        getcEngine().start();
    }

    public ClientSymmetricEngine getcEngine() {
        return cEngine;
    }

    public void setcEngine(ClientSymmetricEngine cEngine) {
        this.cEngine = cEngine;
    }


    // From http://stackoverflow.com/a/23992563/5368599
    public static URL getLog4jConfig() {
        String override = OptionConverter.getSystemProperty("log4j.defaultInitOverride", null);
        if (override == null || "false".equalsIgnoreCase(override)) {
            String configurationOptionStr = OptionConverter.getSystemProperty("log4j.configuration", null);

            URL url;

            if (configurationOptionStr == null) {
                url = Loader.getResource("log4j.xml");
                if (url == null) {
                    url = Loader.getResource("log4j.properties");
                }
            } else {
                try {
                    url = new URL(configurationOptionStr);
                } catch (MalformedURLException ex) {
                    url = Loader.getResource(configurationOptionStr);
                }
            }
            return url;
        } else {
            return null;
        }
    }
}
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.Test;

import static java.lang.Integer.parseInt;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class MyRunner {

    @Karate.Test
    Karate testAll() {
        //run command line: mvn test -Dtest="MyRunner#testAll"
        //mvn clean test -Dtest="MyRunner#testAll" "-Dkarate.options=--tags @regression"
        return Karate.run("class path:features").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSmoke() {
        //run command line: mvn test -Dtest="MyRunner#testSmoke"
        return Karate.run("class path:features").tags("@smoke").relativeTo(getClass());
    }

    @Karate.Test
    Karate testSystemProperty() {
        return Karate.run("class path:features")
                .tags("@regression")
                .karateEnv("prod")
                .systemProperty("user", "admin");

    }

    @Test
    void testParallel() {
        //run command line: mvn test -Dtest="MyRunner#testParallel" -Dcount=6
        String threadCount = System.getProperty("count");
        int count = (threadCount == null) ? 5 : parseInt(threadCount);
        Results results = Runner.path("classpath:features").tags("@regression").parallel(count);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

    @Test
    void testParallelUxer() {
        //run command line: mvn test -Dtest="MyRunner#testParallel" -Dcount=6
        String threadCount = System.getProperty("count");
        int count = (threadCount == null) ? 5 : parseInt(threadCount);
        Results results = Runner.path("classpath:features/uxer").tags("@smoke").outputCucumberJson(true).parallel(count);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());

    }

    @Test
    public Karate runTest() {
        return Karate.run("fileUpload").relativeTo(getClass());
    }

}

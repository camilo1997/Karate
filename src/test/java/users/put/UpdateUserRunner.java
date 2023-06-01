package users.put;

import com.intuit.karate.junit5.Karate;

public class UpdateUserRunner {
    @Karate.Test
    Karate UpdateUserRunner(){
        return Karate.run().relativeTo(getClass());
    }
}

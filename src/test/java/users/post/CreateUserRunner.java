package users.post;

import com.intuit.karate.junit5.Karate;

public class CreateUserRunner {
    @Karate.Test
    Karate CreateUserRunner(){
        return Karate.run().relativeTo(getClass());
    }
}

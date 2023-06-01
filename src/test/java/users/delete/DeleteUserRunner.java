package users.delete;

import com.intuit.karate.junit5.Karate;

public class DeleteUserRunner {
    @Karate.Test
    Karate DeleteUserRunner(){
        return Karate.run().relativeTo(getClass());
    }
}

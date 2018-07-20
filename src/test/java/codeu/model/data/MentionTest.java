package codeu.model.data;

import org.junit.Assert;
import org.junit.Test;

public class MentionTest {

  @Test
  public void testCreate() {
    String message = "test mention @gaurijain";
    String conversation = "test conversation";

    Mention mention = new Mention(message, conversation);

    Assert.assertEquals(message, mention.getMessage());
    Assert.assertEquals(conversation, mention.getConversation());
  }
}

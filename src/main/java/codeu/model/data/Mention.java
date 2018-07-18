package codeu.model.data;

/**
 * Class representing a conversation, which can be thought of as a chat room. Conversations are
 * created by a User and contain Messages.
 */
public class Mention {
  public final String message;
  public final String conversation;

  /**
   * Constructs a new Mention Object.
   *
   * @param message the message a user was mentioned in
   * @param conversation the conversation title a user was mentioned in
   */

  public Mention(String msg, String conversation) {
    this.message = msg;
    this.conversation = conversation;
  }

  /** Returns message the user was mentioned in. */
  public String getMessage() {
    return message;
  }

  /** Returns the conversation title the user was mentioned in. */
  public String getConversation() {
    return conversation;
  }
}

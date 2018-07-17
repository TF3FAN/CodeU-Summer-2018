package codeu.model.data;

import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.UserStore;

import java.time.Instant;
import java.util.UUID;

/** Class representing an event to be shown on the Activity Feed page. */
public class Event {
  private final UUID id;
  private final String name;
  private final Message message;
  private final Instant creation;
  private final String description;
  private final Conversation conversation;

  /**
   * Constructs a new Event.
   *
   * @param id the id of the User who created this Event
   * @param name the username of the User
   * @param message the message the User wrote, if applicable
   * @param creation the creation time of this Event
   * @param description the description of this Event to be displayed
   * @param conversation the conversation the User created, is applicable
   */

  /**
    This constructor is called when a new User is created.
   */
  public Event(UUID id, User user) {
    this.id = id;
    name = user.getName();
    message = null;
    creation = user.getCreationTime();
    conversation = null;
    description = name + " joined!";
  }

  /*
    This constructor is called when a new Conversation is created.
   */
  public Event(UUID id, Conversation convo, String username) {
    this.id = id;
    name = username;
    message = null;
    creation = convo.getCreationTime();
    conversation = convo;
    description = name + " created a new conversation: " + conversation.title + "!";
  }

  /*
    This constructor is called when a new Message is created.
   */
  public Event(UUID id, Message thisMessage, String username, Conversation conversation) {
    this.id = id;
    name = username;
    message = thisMessage;
    creation = thisMessage.getCreationTime();
    this.conversation = conversation;
    description = name + "sent a mesage in " + conversation.title;
  }


  public String display() {
    return this.getDescription();
  }

  /** Returns the UUID. */
  public UUID getID() {
    return id;
  }
  /** Returns the username. */
  public String getName() {
    return name;
  }

  /** Return the message of this Event. */
  public Message getMessage() {
    return message;
  }
  /** Returns the generated  description of this Event. */
  public String getDescription() {
    return description;
  }

  public Conversation getConversation() {
    return conversation;
  }

  /** Returns the creation time of this Event. */
  public Instant getCreationTime() {
    return creation;
  }
}

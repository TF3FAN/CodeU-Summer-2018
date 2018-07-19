package codeu.model.data;

import codeu.model.store.basic.ConversationStore;
import codeu.model.store.basic.UserStore;

import java.time.Instant;
import java.util.UUID;

/** Class representing an event to be shown on the Activity Feed page. */
public class Event {
  private final UUID id;
  private final String name;
  private final Instant creation;
  private final String description;

  /**
   * Constructs a new Event.
   *
   * @param id the id of the Event
   * @param name the username of who prompted the creation of this Event
   * @param creation the time the Event was created
   * @param description the description of this Event to be displayed
   */

  /**
    Created a new Event.
   */
  public Event(UUID id, String name, Instant creation, String description) {
    this.id = id;
    this.name = name;
    this.creation = creation;
    this.description = description;
  }

  /** Returns the UUID. */
  public UUID getID() {
    return id;
  }
  /** Returns the username. */
  public String getName() {
    return name;
  }

  /** Returns the generated  description of this Event. */
  public String getDescription() {
    return description;
  }

  /** Returns the creation time of this Event. */
  public Instant getCreationTime() {
    return creation;
  }
}

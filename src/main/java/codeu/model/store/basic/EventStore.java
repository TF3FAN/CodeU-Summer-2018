package codeu.model.store.basic;

import codeu.model.data.Event;
import codeu.model.store.persistence.PersistentStorageAgent;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * Store class that uses in-memory data structures to hold values and automatically loads from and
 * saves to PersistentStorageAgent. It's a singleton so all servlet classes can access the same
 * instance.
 */
public class EventStore {

  /** Singleton instance of EventStore. */
  private static EventStore instance;

  /** How many Events will be given to the Activity Feed. */
  private static final int DISPLAYCOUNT = 10;

  /**
   * Returns the singleton instance of EventStore that should be shared between all servlet
   * classes. Do not call this function from a test; use getTestInstance() instead.
   */
  public static EventStore getInstance() {
    if (instance == null) {
      instance = new EventStore(PersistentStorageAgent.getInstance());
    }
    return instance;
  }

  /**
   * Instance getter function used for testing. Supply a mock for PersistentStorageAgent.
   *
   * @param persistentStorageAgent a mock used for testing
   */
  public static EventStore getTestInstance(PersistentStorageAgent persistentStorageAgent) {
    return new EventStore(persistentStorageAgent);
  }

  /**
   * The PersistentStorageAgent responsible for loading Events from and saving Events to
   * Datastore.
   */
  private PersistentStorageAgent persistentStorageAgent;

  /** The in-memory list of Events. */
  private List<Event> events;

  /** This class is a singleton, so its constructor is private. Call getInstance() instead. */
  private EventStore(PersistentStorageAgent persistentStorageAgent) {
    this.persistentStorageAgent = persistentStorageAgent;
    events = new ArrayList<>();
  }

  /** Add a new event to the current set of events known to the application. */
  public void addEvent(Event event) {
    events.add(event);
    persistentStorageAgent.writeThrough(event);
  }

  /** Access the current set of conversations known to the application. */
  public List<Event> getAllEvents() {
    return events;
  }
  
  /**
   * Sets the List of Events stored by this EventStore. This should only be called once, when the data
   * is loaded from Datastore.
   */
  public void setEvents(List<Event> events) {
    this.events = events;
  }
  /** Collects 10 most recently created Events for display on Activity Feed. */
  public List<Event> getEvents() {

    List<Event> toBeDisplayed = new ArrayList<>();

    for (int i = 0; i < DISPLAYCOUNT; i++) {
      if(events.isEmpty()) {
        break;
      }
      Event storedEvent = events.get(i);
      toBeDisplayed.add(storedEvent);
    }
    return toBeDisplayed;
  }
}

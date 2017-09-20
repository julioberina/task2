# task2

For this assignment, I decided to use a class with another class inside of it.  I created an EventList class with an Event inside,
which is like a node with all the necessary information.  I asked for the information one by one and validated it by making sure the dates
were valid, times were valid, and marked flags like "conflict" in case there was a collision.  The invalid date was a problem for me
so I decided to use the Date module provided in the Ruby library since it automatically threw an Exception whenever it happened.

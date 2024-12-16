from i3ipc import Connection, Event, WindowEvent
from time import sleep

i3 = Connection()

def on_window_created(self, e: WindowEvent):
    window = e.container
    # pretty print window
    for key, value in window.__dict__.items():
        print(f"{key}: {value}")
    
    # move window
    window.command("floating enable")


i3.on(Event.WINDOW_NEW, on_window_created)

i3.main()
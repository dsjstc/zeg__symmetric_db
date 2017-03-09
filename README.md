# Symmetric DS demo package

In the process of trying to make things work, I scripted this demo, to 
allow me to restart the demo quickly with a totally clean setup.
The scripts are linux-only, but you should be able to get the idea 
by reading them.

I'm also including an embedded client and server that talk with the 
same demo.

rundemo/ 

This basically just runs the store/corp demo from the v3.8 tutorial
against a SQLite databases.  I've fixed things up a little to allow 
the symmetricDS program directory to be read-only, and to run through
symlinks.

1. Enter the rundemo directory
2. Modify env.sh to match your environment
   Modify *.properties if you don't want your DB files in /tmp
3. Run the following scripts.
  0-setup.sh (creates working directories.  Replaces the symmetricDS 
				setenv.sh with something that supports symlinks.)
  1-create.sh (sets up the root and client1 databases)
  2-run_root.sh (runs the root node)
  3-run_client1.sh (...)
  4-eginsert.sh (adds a random item, you can use this to watch propagation)


emsy/emclient/

A (very minimal) embedded client that registers with and talks to the 
demo root node.  

1. Run the server.  You might use the rundemo stuff for this.
2. Run emsy/scripts/setup.sh to create an initial client2.sqlite
	(An embedded client can't set itself up!)
3. Build and run.  IntelliJ only, sorry!

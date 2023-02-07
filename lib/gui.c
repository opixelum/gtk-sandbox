#include <gtk/gtk.h>

static void onActivate(GtkApplication *app)
{
    // Create a new window
    GtkWidget *window = gtk_application_window_new(app);

    // Create a new button
    GtkWidget *button = gtk_button_new_with_label("Hello, World!");

    // When the button is clicked, close the window passed as an argument
    g_signal_connect_swapped(button, "clicked", G_CALLBACK(gtk_window_close), window);
    gtk_window_set_child(GTK_WINDOW(window), button);
    gtk_window_present(GTK_WINDOW(window));
}

package gui;

import javax.swing.*;
import java.awt.*;

public class Main
{
  private static void createAndShowGUI()
  {
	//Create and set up the window.
	JFrame frame = new JFrame("Progetto");
	frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);


	frame.setLocationRelativeTo(null);

	frame.setResizable(true);

	frame.setMinimumSize(new Dimension(800, 700));
	

	try {
	  UIManager.setLookAndFeel("com.sun.java.swing.plaf.gtk.GTKLookAndFeel");
	}
	catch(Exception e){
	  return;
	}

	frame.setContentPane(new Login().getRootPanel());

	frame.pack();
	frame.setVisible(true);



  }


  public static void main(String[] args)
  {
	//Schedule a job for the event-dispatching thread:
	//creating and showing this application's GUI.
	javax.swing.SwingUtilities.invokeLater(new Runnable() {
	  public void run()
	  {
		createAndShowGUI();
	  }
	});
  }
}

package gui;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.util.Locale;
import java.util.MissingResourceException;
import java.util.ResourceBundle;

/**
 * TYPE : class - gui package
 * NAME : GuiConfiguration
 *
 * DESC: TODO
 */
public class GuiConfiguration
{
	private static ResourceBundle currentResourceBundle;

	private static Integer inputColumn;

	private static Font outputFont;
	private static Font outputBoldFont;
	private static Font outputLargeFont;
	private static Font outputBoldLargeFont;
	private static Font outputSmallFont;
	private static Font outputBoldSmallFont;

	private static Integer tableRowHeight;

	private static Integer comboBoxMaximumRowCount;

	private static Cursor buttonCursor;

	private static Border searchPanelBorder;

	private static Border labelBorder;

	private static Dimension frameMinimumSize;


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 *
	 * DESC: TODO
	 */
	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		Locale.setDefault(Locale.of("it", "IT"));

		if (!setResourceBundle(Locale.getDefault()) )
		{
			return;
		}

		// text and password field config
		inputColumn = 25;

		//font per il testo
		outputLargeFont = new Font(Font.SANS_SERIF, Font.PLAIN, 30);
		outputBoldLargeFont = outputLargeFont.deriveFont(Font.BOLD);

		outputFont = new Font(Font.SANS_SERIF, Font.PLAIN, 18);
		outputBoldFont = outputFont.deriveFont(Font.BOLD);

		outputSmallFont = new Font(Font.SANS_SERIF, Font.PLAIN, 15);
		outputBoldSmallFont = outputSmallFont.deriveFont(Font.BOLD);

		//tabella config
		tableRowHeight = 25;

		//combo box config
		comboBoxMaximumRowCount = 5;

		// bottone config
		buttonCursor = new Cursor(Cursor.HAND_CURSOR);

		//bordo per i pannelli ricerca
		searchPanelBorder = new CompoundBorder
								(
									new EmptyBorder(0, 10, 10, 10),
									new MatteBorder(0, 10, 10, 10, Color.WHITE)
								);

		//bordo label config
		labelBorder = new CompoundBorder
							(
								new EmptyBorder(4, 4, 4, 4),
								new MatteBorder(0, 0, 1, 0, Color.BLACK)
							);



		//minima size del frame
		frameMinimumSize = new Dimension(1500, 1000);

	}


	/**
	 * TYPE : static method - gui package
	 * NAME : getMessage
	 *
	 * DESC: TODO
	 */
	public static String getMessage(String key)
	{
		try
		{
			return currentResourceBundle.getString(key);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			return null;
		}
	}

	/**
	 * TYPE : static method - gui package
	 * NAME : getInputColumn
	 *
	 * DESC: TODO
	 */
	public static Integer getInputColumn() { return inputColumn; }

	/**
	 * TYPE : static method - gui package
	 * NAME : outputLargeFont
	 *
	 * DESC: TODO
	 */
	public static Font outputLargeFont() { return outputLargeFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldLargeFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldLargeFont() { return outputBoldLargeFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputFont() { return outputFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldFont() { return outputBoldFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputSmallFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputSmallFont() { return outputSmallFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldSmallFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldSmallFont() { return outputBoldSmallFont; }


	/**
	 * TYPE : static method - gui package
	 * NAME : getTableRowHeight
	 *
	 * DESC: TODO
	 */
	public static Integer getTableRowHeight() { return tableRowHeight; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getComboBoxMaximumRowCount
	 *
	 * DESC: TODO
	 */
	public static Integer getComboBoxMaximumRowCount() { return comboBoxMaximumRowCount; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getButtonCursor
	 *
	 * DESC: TODO
	 */
	public static Cursor getButtonCursor() { return buttonCursor; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getSearchPanelBorder
	 *
	 * DESC: TODO
	 */
	public static Border getSearchPanelBorder() { return searchPanelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getLabelBorder
	 *
	 * DESC: TODO
	 */
	public static Border getLabelBorder() { return labelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getFrameMinimumSize
	 *
	 * DESC: TODO
	 */
	public static Dimension getFrameMinimumSize() { return frameMinimumSize; }


	/**
	 * TYPE : static method - gui package
	 * NAME : setResourceBundle
	 *
	 * DESC: TODO
	 */
	public static boolean setResourceBundle(Locale locale)
	{
		try
		{
			currentResourceBundle = ResourceBundle.getBundle("guiBundle", locale);
		}
		catch (MissingResourceException e)
		{
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath) { return createImageIcon(imagePath, 30, 30); }


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath, int width, int height)
	{
		java.net.URL imageURL = ClassLoader.getSystemResource(imagePath);

		if (imageURL != null)
		{
			ImageIcon imageIcon = new ImageIcon(imageURL);

			Image image = imageIcon.getImage().getScaledInstance(width, height, Image.SCALE_DEFAULT);

			return new ImageIcon(image);
		}

		return null;

	}
}

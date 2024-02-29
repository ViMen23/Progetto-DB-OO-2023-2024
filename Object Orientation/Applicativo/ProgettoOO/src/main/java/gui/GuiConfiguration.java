
package gui;

import controller.Controller;
import model.Team;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;
import java.time.Year;
import java.time.YearMonth;
import java.util.*;

/**
 * TYPE : class - gui package
 * NAME : GuiConfiguration
 *
 * DESC: TODO
 */
public class GuiConfiguration
{
	private static final Integer inputColumn = 35;
	private static final Integer tableRowHeight = 25;
	private static final Integer comboBoxMaximumRowCount = 5;
	private static final Cursor buttonCursor = new Cursor(Cursor.HAND_CURSOR);
	private static final Border searchLabelBorder = BorderFactory.createEmptyBorder(2,10,2,0);
	private static final Color searchPanelColor = new Color(50, 100, 200);

	public static final String displayValue = "xxxxxxxxxxxxxxxxxxxxxxxxxx";
	private static final Integer minYear = 1810;
	private static final Integer minAge = 15;
	private static final Integer maxAge = 50;
	private static final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private static final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private static final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	public static final Vector<String> countryTableColumnName = new Vector<>();
	public static final Vector<String> confederationTableColumnName = new Vector<>();
	public static final Vector<String> competitionTableColumnName = new Vector<>();
	public static final Vector<String> teamTableColumnName = new Vector<>();
	public static final Vector<String> teamParticipationTableColumnName = new Vector<>();
	public static final Vector<String> playerTableColumnName = new Vector<>();
	public static final Vector<String> teamTrophyTableColumnName = new Vector<>();
	public static final Vector<String> teamPrizeTableColumnName = new Vector<>();
	public static final Vector<String> playerPositionTableColumnName = new Vector<>();
	public static final Vector<String> playerNationalityTableColumnName = new Vector<>();
	public static final Vector<String> playerAttributeGoalkeepingTableColumnName = new Vector<>();
	public static final Vector<String> playerAttributeMentalTableColumnName = new Vector<>();
	public static final Vector<String> playerAttributePhysicalTableColumnName = new Vector<>();
	public static final Vector<String> playerAttributeTechnicalTableColumnName = new Vector<>();
	public static final Vector<String> playerTagTableColumnName = new Vector<>();
	public static final Vector<String> playerClubCareerTableColumnName = new Vector<>();
	public static final Vector<String> playerNationalCareerTableColumnName = new Vector<>();
	public static final Vector<String> playerStatisticTableColumnName = new Vector<>();
	public static final Vector<String> playerClubTrophyTableColumnName = new Vector<>();
	public static final Vector<String> playerNationalTrophyTableColumnName = new Vector<>();
	public static final Vector<String> playerPrizeTableColumnName = new Vector<>();
	public static final Vector<String> statisticTotalTableColumnName = new Vector<>();
	public static final Vector<String> statisticEditionTableColumnName = new Vector<>();
	public static final Vector<String> statisticTableColumnName = new Vector<>();

	public static final String generalSearchPanelLayoutConstraint = "debug, flowy, fill";
	public static final String generalSearchPanelColumnConstraint = "0[]0";
	public static final String generalSearchPanelRowConstraint = "10[]10[]0[]10";
	public static final String generalSearchPanelAddConstraint = "sgx frame, growy";

	public static final String topSearchPanelLayoutConstraint = "debug, flowx";
	public static final String topSearchPanelColumnConstraint = "0[]110[]0";
	public static final String topSearchPanelRowConstraint = "10[]10";
	public static final String topSearchPanelAddConstraint = "sgx general, dock north";

	public static final String buttonTopSearchPanelAddConstraint = "width 80%";

	public static final String middleSearchPanelLayoutConstraint = "debug, wrap 2";

	public static final String middleSearchPanelColumnConstraint = "10[60%, fill]50[35%, fill]10";

	public static final String middleSearchPanelRowConstraint = "0[]0[fill]10[]0[fill]20[]0";
	public static final String middleSearchPanelAddConstraint = "dock center, sgx general";

	public static final String firstColumnMiddleSearchPanelAddConstraint = "sgx panel_first_column";
	public static final String secondColumnMiddleSearchPanelAddConstraint = "sgx sgx panel_second_column";
	public static final String countryTypeLayoutConstraint = "debug, flowx, center";
	public static final String countryTypeColumnConstraint = "[20%]10%[20%]10%[20%]";
	public static final String countryTypeRowConstraint = "10[]10";
	public static final String countryTypeAddConstraint = "sgx panel_first_column";

	public static final String infoPanelLayoutConstraint = "debug, flowy";
	public static final String infoPanelAddConstraint = "sgx panel_second_column";

	public static final String chooseContinentLayoutConstraint = "debug, wrap 2";
	public static final String chooseContinentColumnConstraint = "5%[20%]10:push[40%]5%";
	public static final String chooseContinentRowConstraint = "10[]20[]10";

	public static final String chooseContinentAddConstraint = "sgx panel_first_column";
	public static final String searchButtonAddConstraint = "span 2";

	public static final String tablePanelLayoutConstraint = "debug, flowy";
	public static final String tablePanelColumnConstraint = "[grow, fill]";
	public static final String tablePanelRowConstraint = "10[]10";
	public static final String tablePanelAddConstraint = "dock south, sgx general";
	public static final String competitionMiddleSearchPanelRowConstraint = "0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0";




	private static ResourceBundle currentResourceBundle;

	private static Font outputFont;
	private static Font outputBoldFont;
	private static Font outputLargeFont;
	private static Font outputBoldLargeFont;
	private static Font outputSmallFont;
	private static Font outputBoldSmallFont;

	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 *
	 * DESC: TODO
	 */
	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		setLocale(Locale.of("it", "IT"));

		initUIManager();
		initHomeFrame();
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();

		TopPanel topPanel = new TopPanel();

		mainFrame.add(topPanel, "sgx frame");

		//MenuBarPanel menuBarPanel = new MenuBarPanel();

		//mainFrame.add(menuBarPanel, "sgx frame");

		mainFrame.pack();
		mainFrame.setVisible(true);
	}

	public static void resetHomeFrame()
	{
		for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
			MainFrame.getMainFrameInstance().remove(component);
		}

		initHomeFrame();
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 *
	 * DESC: TODO
	 */

	public static void initUIManager()
	{
		try {
			for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
				if ("Nimbus".equals(info.getName())) {
					UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (Exception e) {
			System.err.println("Error nimbus not found");
			return;
		}



		//font testo
		Font font = new JPanel().getFont();

		float size = 25;

		outputLargeFont = font.deriveFont(size);
		outputBoldLargeFont = outputLargeFont.deriveFont(Font.BOLD);

		size = 18;

		outputFont = font.deriveFont(size);
		outputBoldFont = outputFont.deriveFont(Font.BOLD);

		size = 13;

		outputSmallFont = font.deriveFont(size);
		outputBoldSmallFont = outputSmallFont.deriveFont(Font.BOLD);


		//Configurazioni generali
		UIManager.put("nimbusBase", new Color(130, 130, 130));
		UIManager.put("nimbusBlueGrey", new Color(50, 100, 150));
		UIManager.put("control", new Color(230, 230, 230));


		//Configurazioni bottone
		UIManager.put("Button.font", outputFont);
		UIManager.put("Button.textForeground", Color.white);

		//Configurazioni checkBox
		UIManager.put("CheckBox.background", Color.green);
		UIManager.put("CheckBox.font", outputFont);

		//Configurazioni comboBox
		UIManager.put("ComboBox.font", outputFont);
		UIManager.put("ComboBox.foreground", Color.white);

		//Configurazioni radioButton
		UIManager.put("RadioButton.background", Color.green);
		UIManager.put("RadioButton.font", outputFont);
		UIManager.put("RadioButton.foreground", Color.white);

		//Configurazioni label
		//UIManager.put("Label.background", Color.green);
		UIManager.put("Label.font", outputFont);
		//UIManager.put("Label.foreground", Color.white);
		UIManager.put("Label[Enabled].textForeground", Color.black);

		//configurazioni menu
		UIManager.put("Menu.font", outputFont);
		UIManager.put("Menu[Enabled].textForeground", Color.white);

		//configurazioni menuItem
		UIManager.put("MenuItem.font", outputSmallFont);

		//configurazioni panel
		UIManager.put("Panel.font", outputFont);

		// configurazioni text field
		UIManager.put("TextField.font", outputFont);

		//configurazioni field password
		UIManager.put("PasswordField.font", outputFont);
		UIManager.put("PasswordField.echoChar", '⚫');

		//configurazioni table
		UIManager.put("Table.font", outputFont);
		UIManager.put("Table.textForeground", Color.black);

		//configurazione intestazione tabella
		UIManager.put("TableHeader.font", outputBoldFont);
		UIManager.put("TableHeader.textForeground", Color.white);
	}

	public void initTableColumn()
	{
		String string;

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();

		countryTableColumnName.add(string);
		confederationTableColumnName.add(string);
		competitionTableColumnName.add(string);
		teamTableColumnName.add(string);
		playerClubCareerTableColumnName.add(string);
		playerNationalityTableColumnName.add(string);
		playerTableColumnName.add(string);


		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();

		countryTableColumnName.add(string);
		playerPositionTableColumnName.add(string);
		confederationTableColumnName.add(string);
		teamTableColumnName.add(string);


		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();

		countryTableColumnName.add(string);
		confederationTableColumnName.add(string);
		competitionTableColumnName.add(string);
		teamTableColumnName.add(string);
		playerClubCareerTableColumnName.add(string);
		teamParticipationTableColumnName.add(string);


		string = GuiConfiguration.getMessage("superCountry");
		string = string.toUpperCase();

		countryTableColumnName.add(string);


		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		confederationTableColumnName.add(string);
		competitionTableColumnName.add(string);
		teamParticipationTableColumnName.add(string);


		string = GuiConfiguration.getMessage("superConfederation");
		string = string.toUpperCase();

		confederationTableColumnName.add(string);


		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();

		competitionTableColumnName.add(string);
		teamParticipationTableColumnName.add(string);
		teamTrophyTableColumnName.add(string);
		playerStatisticTableColumnName.add(string);
		playerClubTrophyTableColumnName.add(string);
		playerNationalTrophyTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		competitionTableColumnName.add(string);


		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		teamTableColumnName.add(string);
		playerClubCareerTableColumnName.add(string);
		playerNationalCareerTableColumnName.add(string);
		playerStatisticTableColumnName.add(string);
		playerClubTrophyTableColumnName.add(string);
		playerNationalTrophyTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();

		teamTrophyTableColumnName.add(string);
		playerClubTrophyTableColumnName.add(string);
		playerNationalTrophyTableColumnName.add(string);


		string = GuiConfiguration.getMessage("prize");
		string = string.toUpperCase();

		teamPrizeTableColumnName.add(string);
		playerPrizeTableColumnName.add(string);


		string = GuiConfiguration.getMessage("given");
		string = string.toUpperCase();

		teamPrizeTableColumnName.add(string);
		playerPrizeTableColumnName.add(string);


		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();

		playerTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);


		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		playerTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);


		string = GuiConfiguration.getMessage("dob");
		string = string.toUpperCase();

		playerTableColumnName.add(string);


		string = GuiConfiguration.getMessage("foot");
		string = string.toUpperCase();

		playerTableColumnName.add(string);


		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		playerTableColumnName.add(string);
		playerPositionTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);


		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();

		playerTableColumnName.add(string);
		playerPositionTableColumnName.add(string);


		string = GuiConfiguration.getMessage("retiredDate");
		string = string.toUpperCase();

		playerTableColumnName.add(string);


		string = GuiConfiguration.getMessage("attribute");
		string = string.toUpperCase();

		playerAttributeGoalkeepingTableColumnName.add(string);
		playerAttributeMentalTableColumnName.add(string);
		playerAttributePhysicalTableColumnName.add(string);
		playerAttributeTechnicalTableColumnName.add(string);


		string = GuiConfiguration.getMessage("value");
		string = string.toUpperCase();

		playerAttributeGoalkeepingTableColumnName.add(string);
		playerAttributeMentalTableColumnName.add(string);
		playerAttributePhysicalTableColumnName.add(string);
		playerAttributeTechnicalTableColumnName.add(string);


		string = GuiConfiguration.getMessage("tag");
		string = string.toUpperCase();

		playerTagTableColumnName.add(string);


		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();

		playerClubCareerTableColumnName.add(string);
		playerNationalCareerTableColumnName.add(string);
		playerStatisticTableColumnName.add(string);
		playerClubTrophyTableColumnName.add(string);
		playerNationalTrophyTableColumnName.add(string);
		playerPrizeTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);


		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();

		playerStatisticTableColumnName.add(string);
		statisticTotalTableColumnName.add(string);
		statisticEditionTableColumnName.add(string);
		statisticTableColumnName.add(string);
	}



	public static void setLocale(Locale locale)
	{
		Locale.setDefault(locale);
		setResourceBundle(locale);
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : getMessage
	 *
	 * DESC: TODO
	 */
	public static String getMessage(String key)
	{
		try {
			return currentResourceBundle.getString(key);
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "";
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
	public static Border getSearchLabelBorder() { return searchLabelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getSearchPanelColor
	 *
	 * DESC: TODO
	 */
	public static Color getSearchPanelColor() { return searchPanelColor; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getDisplayValue
	 *
	 * DESC: TODO
	 */
	public static String getDisplayValue() { return displayValue; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMinYear
	 *
	 * DESC: TODO
	 */
	public static Integer getMinYear() { return minYear; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMinAge
	 *
	 * DESC: TODO
	 */
	public static Integer getMinAge() { return minAge; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMaxAge
	 *
	 * DESC: TODO
	 */
	public static Integer getMaxAge() { return maxAge; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMinimizeIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon getMinimizeIcon() { return minimizeIcon; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMaximizeIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon getMaximizeIcon() { return maximizeIcon; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getResetIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon getResetIcon() { return resetIcon; }

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

		if (imageURL != null) {
			ImageIcon imageIcon = new ImageIcon(imageURL);
			Image image = imageIcon.getImage().getScaledInstance(width, height, Image.SCALE_DEFAULT);

			return new ImageIcon(image);
		}

		return null;
	}


	/**
	 * TODO
	 * @param dataVector
	 * @param hashMap
	 * @param selectAll
	 */
	public static void initComboBoxVector(Vector<String> dataVector, Map<String, String> hashMap, Boolean selectAll)
	{
		String string;

		dataVector.clear();
		hashMap.clear();

		if (selectAll) {
			string = GuiConfiguration.getMessage("select");
			string += " ";
			string += GuiConfiguration.getMessage("all");
			string = StringUtils.capitalize(string);

			dataVector.add(string);
			hashMap.put(string, null);
		}
	}

	/**
	 * TODO
	 * @param label
	 * @param tableName
	 * @param countRows
	 */
	public static void setTitleTable(JLabel label,String tableName, int countRows)
	{
		String string;

		string = GuiConfiguration.getMessage("results");
		string += " ";
		string += tableName;
		string += " - ";
		string += countRows;
		string += " ";
		string += GuiConfiguration.getMessage("results");
		string = string.toUpperCase();

		label.setText(string);
	}




	/**
	 * TYPE : static method - gui package
	 * NAME : fillYearComboBox
	 *
	 * DESC: TODO
	 */
	public static void fillYearComboBox(JComboBox<String> comboBox, Integer minimumYear, Integer maximumYear)
	{

		comboBox.removeAllItems();

		for( Integer i = maximumYear; i >= minimumYear; --i){
			comboBox.addItem(i.toString());
		}

	}


	public static void fillSeasonComboBox(JComboBox<String> comboBox,
										  Integer minimumYear,
										  String teamType,
										  Map<String, String> seasonMap)
	{
		String string;
		Integer maximumYear = Year.now().getValue();
		Integer month = YearMonth.now().getMonthValue();


		comboBox.removeAllItems();


		if (month < 8) {
			--maximumYear;
		}


		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.NATIONAL.toString())) {
			fillYearComboBox(comboBox, minimumYear, maximumYear);
		}
		else {
			for (Integer i = maximumYear; i >= minimumYear; --i) {
				string = i + " - " + (i + 1) % 100;

				comboBox.addItem(string);
				seasonMap.put(string, i.toString());
			}
		}
	}

	public static void fillSeasonComboBox(JComboBox<String> comboBox,
										  Vector<String> vector,
										  Map<String, String> map,
										  String teamType,
										  String competitionID,
										  Boolean selectAll)
	{
		String season;

		comboBox.removeAllItems();

		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCompetitionEditionComboBox(vector, competitionID);


		if (teamType.equalsIgnoreCase(Team.TEAM_TYPE.CLUB.toString())) {
			for (String string : vector) {

				Integer year = Integer.valueOf(string);

				season = year.toString();
				season += " - ";

				year = (++year)%100;

				season += year.toString();

				comboBox.addItem(season);

				map.put(season, string);
			}
		}
		else {
			fillComboBox(comboBox, vector);
		}
	}

	/**
	 *
	 * @param comboBox
	 * @param comboBoxDataVector
	 */
	public static void fillComboBox(JComboBox<String> comboBox, Vector<String> comboBoxDataVector)
	{
		comboBox.setModel(new DefaultComboBoxModel<>(comboBoxDataVector));
	}

	/**
	 *
	 * @param table
	 * @param tableData
	 * @param tableColumnName
	 */
	public static void fillTable(JTable table, Vector<Vector<String>> tableData, Vector<String> tableColumnName)
	{
		table.setModel(new TableModel(tableData, tableColumnName));

		table.setPreferredScrollableViewportSize(table.getPreferredSize());
	}

	/**
	 *
	 * @param container
	 * @param panelToAdd
	 * @param index
	 * @param constraint
	 */
	public static void switchPanel(Container container, JPanel panelToAdd, Integer index, String constraint)
	{
		Component component = container.getComponent(index);

		component.setVisible(false);

		container.remove(component);

		container.add(panelToAdd, constraint);

		panelToAdd.setVisible(true);
	}

	/**
	 *
	 * @param mainPanel
	 * @param panelToMinimize
	 * @param button
	 * @param constraint
	 */
	public static void minimizePanel(JPanel mainPanel, JPanel panelToMinimize, JButton button, String constraint)
	{
		if (panelToMinimize.isShowing()) {

			mainPanel.remove(panelToMinimize);

			button.setIcon(minimizeIcon);
		} else {
			mainPanel.add(panelToMinimize, constraint);
			button.setIcon(maximizeIcon);
		}

		mainPanel.revalidate();
	}

	/**
	 * TODO
	 * @param comboBox
	 * @param comboBoxMap
	 * @return
	 */

	public static String getSelectedItemIDComboBox(JComboBox<String> comboBox, Map<String, String> comboBoxMap)
	{
		String selectedStringID = comboBoxMap.get(getSelectedItemComboBox(comboBox));

		return selectedStringID;
	}

	/**
	 * TODO
	 * @param comboBox
	 * @return
	 */
	public static String getSelectedItemComboBox(JComboBox<String> comboBox)
	{
		String selectedString = (String) comboBox.getSelectedItem();

		comboBox.removeAllItems();
		comboBox.addItem(selectedString);

		return selectedString;
	}


}

package gui;

import database.DatabaseConnection;

import javax.swing.*;
import java.awt.*;
import java.sql.SQLException;
import java.util.*;

/**
 * TYPE : class - gui package
 * <p>
 * NAME : GuiConfiguration
 * <p>
 * DESC: TODO
 */
public class GuiConfiguration
{
	public static final int INPUT_COLUMN = 35;
	public static final int MIN_YEAR = 1810;
	public static final int MIN_AGE = 15;
	public static final int MAX_AGE = 50;

	public static final Cursor HAND_CURSOR = new Cursor(Cursor.HAND_CURSOR);

	public static final Vector<String> COUNTRY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> CONFEDERATION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> COMPETITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_SQUAD_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PARTICIPATING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_POSITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONALITY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TAG_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_STATISTIC_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TOTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_EDITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TABLE_COLUMN_NAME = new Vector<>();


	public static final String DEBUG_LAYOUT_CONSTRAINT = "debug";
	public static final String VLAYOUT_CONSTRAINT = "debug, flowy";
	public static final String VFILL_LAYOUT_CONSTRAINT = "debug, flowy, fill";
	public static final String WRAP_2_LAYOUT_CONSTRAINT = "debug, wrap 2";
	public static final String CENTER_LAYOUT_CONSTRAINT = "debug, center";
	public static final String CENTER_VLAYOUT_CONSTRAINT = "debug, flowy, center";
	public static final String CENTER_WRAP_2_LAYOUT_CONSTRAINT = "debug, center, wrap 2";

	public static final String ONE_CELL_LAYOUT_CONSTRAINT = "[]";
	public static final String ONE_CELL_GAP_0_10 = "0[]";
	public static final String ONE_CELL_GAP_0_LAYOUT_CONSTRAINT = "0[]0";
	public static final String ONE_CELL_TOP_LAYOUT_CONSTRAINT = "[top]";
	public static final String ONE_GROW_FILL_CELL = "[grow, fill]";
	public static final String TWO_CELL_LAYOUT_CONSTRAINT = "[][]";
	public static final String TWO_CELL_EXT_GAP_0_INT_GAP_110_LAYOUT_CONSTRAINT = "0[]110[]0";
	public static final String TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT = "20[59%, fill]50[35%, fill]20";
	public static final String TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT = "5%[20%]10:push[40%]5%";
	public static final String TWO_CELL_GROW_FILL_LAYOUT_CONSTRAINT = "[grow, fill][grow, fill]";
	public static final String TWO_CELL_SIZE_15P_INT_GAP_150_LAYOUT_CONSTRAINT = "[15%, fill]150[15%, fill]";
	public static final String THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT = "10[][][]";
	public static final String THREE_CELL_EXT_GAP_0_10_LAYOUT_CONSTRAINT = "0[][][]";
	public static final String THREE_CELL_EXT_GAP_0_INT_GAP_0_10_LAYOUT_CONSTRAINT = "0[]0[][]0";
	public static final String THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT = "20:push[]20[]20[]20:push";
	public static final String THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT = "[20%]10%[20%]10%[20%]";
	public static final String FOUR_CELL_SIZE_15P_GAP_8P = "8%[15%]8%[15%]8%[15%]8%[15%]8%";
	public static final String FIVE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill]10[]0[fill]20[]0";
	public static final String SEVEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill]20[]0";
	public static final String NINE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill]20[]0";
	public static final String THIRTEEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill][]0[fill][]0[fill]20[]0";

	public static final String HGROUP_FRAME_ADD_CONSTRAINT = "sgx frame";
	public static final String HGROUP_FRAME_VGROW_ADD_CONSTRAINT = "sgx frame, growy";
	public static final String HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT = "sgx general, dock north";
	public static final String HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT = "sgx general, dock center,";
	public static final String HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT = "sgx general, dock south";
	public static final String HGROUP_FIRST_COLUMN_ADD_CONSTRAINT = "sgx first_column";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 2, flowy, gap bottom 0";

	public static final String HGROUP_FIRST_COLUMN_VSPLIT_THREE_ADD_CONSTRAINT = "sgx first_column, split 3, flowy";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 3, flowy, gap bottom 0";
	public static final String HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT = "sgx first_column, gap bottom 0";
	public static final String HGROUP_SECOND_COLUMN_ADD_CONSTRAINT = "sgx second_column";
	public static final String HGRUOP_ADD_CONSTRAINT = "sgx group";
	public static final String WIDTH_80P_ADD_CONSTRAINT = "width 80%";
	public static final String SPAN_2_ADD_CONSTRAINT = "span 2";

	private static ResourceBundle currentResourceBundle;

	public static Font outputFont;
	public static  Font outputBoldFont;
	public static Font outputSmallFont;


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 * DESC: TODO
	 */
	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		setLocale(Locale.of("it", "IT"));

		initUIManager();
		initHomeFrame();
		initTableColumn();
		try {
			DatabaseConnection.getInstance();
		} catch (SQLException e) {
			System.out.println("ERRORE: " + e.getMessage());
		}
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();
		TopPanel topPanel = new TopPanel();
		mainFrame.add(topPanel, HGROUP_FRAME_ADD_CONSTRAINT);
		MenuBarPanel menuBarPanel = new MenuBarPanel();
		mainFrame.add(menuBarPanel, HGROUP_FRAME_ADD_CONSTRAINT);
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

		outputFont = new JPanel().getFont().deriveFont(18F);
		outputBoldFont = outputFont.deriveFont(Font.BOLD);
		outputSmallFont = outputFont.deriveFont(13F);

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
		UIManager.put("Label.font", outputFont);
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

		//configurazione text field
		UIManager.put("TextArea.font", outputFont);
	}

	public static void initCountryTableColumnName()
	{
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("superCountry"));
	}

	public static void initConfederationTableColumnName()
	{
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("superConfederation"));
	}

	public static void initCompetitionTableColumnName()
	{
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("teamType"));
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initTeamTableColumnName()
	{
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initTeamSquadTableColumnName()
	{
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
	}
	public static void initTeamParticipantTableColumnName()
	{
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));
	}

	public static void initTeamTrophyTableColumnName()
	{
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy"));
	}

	public static void initTeamPrizeTableColumnName()
	{
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("prize"));
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("given"));
	}

	public static void initPlayerTableColumnName()
	{
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("dob"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("foot"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("position").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("retiredDate"));
	}

	public static void initPlayerPositionTableColumnName()
	{
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("position"));
	}

	public static void initPlayerNationalityTableColumnName()
	{
		PLAYER_NATIONALITY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initPlayerAttributeTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("attribute");
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("value");
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerTagTableColumnName()
	{
		PLAYER_TAG_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("tag"));
	}

	public static void initPlayerClubCareerTableColumnName()
	{
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type"));
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initPlayerNationalityCareerTableColumnName()
	{
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
	}

	public static void initPlayerStatisticTableColumnName()
	{
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded"));
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved"));
	}

	public static void initPlayerClubTrophyTableColumnName()
	{
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy"));
	}

	public static void initPlayerNationalTrophyTableColumnName()
	{
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy"));
	}

	public static void initPlayerPrizeTableColumnName()
	{
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("prize"));
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("given"));
	}

	public static void initStatisticTotalTableColumnName()
	{
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved"));
	}
	public static void initStatisticEditionTableColumnName()
	{
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved"));

	}
	public static void initStatisticTableColumnNameTableColumnName()
	{
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded"));
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved"));
	}

	public static void initTableColumn()
	{
		initCountryTableColumnName();
		initConfederationTableColumnName();
		initCompetitionTableColumnName();
		initTeamTableColumnName();
		initTeamSquadTableColumnName();
		initTeamParticipantTableColumnName();
		initTeamTrophyTableColumnName();
		initTeamPrizeTableColumnName();
		initPlayerTableColumnName();
		initPlayerPositionTableColumnName();
		initPlayerNationalityTableColumnName();
		initPlayerAttributeTableColumnName();
		initPlayerTagTableColumnName();
		initPlayerClubCareerTableColumnName();
		initPlayerNationalityCareerTableColumnName();
		initPlayerStatisticTableColumnName();
		initPlayerClubTrophyTableColumnName();
		initPlayerNationalTrophyTableColumnName();
		initPlayerPrizeTableColumnName();
		initStatisticTotalTableColumnName();
		initStatisticEditionTableColumnName();
		initStatisticTableColumnNameTableColumnName();
	}

	public static void setLocale(Locale locale)
	{
		Locale.setDefault(locale);
		setResourceBundle(locale);
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : getMessage
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
	 * NAME : setResourceBundle
	 * DESC: TODO
	 */
	public static boolean setResourceBundle(Locale locale)
	{
		try {
			currentResourceBundle = ResourceBundle.getBundle("guiBundle", locale);
		} catch (MissingResourceException e) {
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}

	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath)
	{
		return createImageIcon(imagePath, 30, 30);
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath,
																					int width,
																					int height)
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
	 *
	 * @param container
	 * @param panelToAdd
	 * @param index
	 * @param constraint
	 */
	public static void switchPanel(Container container,
																 JPanel panelToAdd,
																 Integer index,
																 String constraint)
	{
		Component component = container.getComponent(index);
		component.setVisible(false);
		container.remove(component);
		container.add(panelToAdd, constraint);
		panelToAdd.setVisible(true);
	}
}

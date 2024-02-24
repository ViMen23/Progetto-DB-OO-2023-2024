
package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.event.PopupMenuEvent;
import javax.swing.event.PopupMenuListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;


public class MilitancyFilterPanel
				extends JPanel
{

	protected final Color panelColor = Color.white;
	private final ImageIcon minimizeIcon = GuiConfiguration.createImageIcon("images/minimize.png");
	private final ImageIcon maximizeIcon = GuiConfiguration.createImageIcon("images/maximize.png");
	private final ImageIcon errorIcon = GuiConfiguration.createImageIcon("images/error.png");
	private final ImageIcon resetIcon = GuiConfiguration.createImageIcon("images/reset.png");

	protected JPanel militancyPanel;
	protected JPanel teamTypePanel;
	protected JPanel countryConfederationPanel;
	protected JPanel teamPanel;
	protected JPanel yearPanel;


	protected JButton titleButton;
	protected JButton teamTypeResetButton;
	private final JButton teamResetButton;
	private final JButton yearResetButton;
	protected JButton searchButton;

	protected JRadioButton clubRadioButton;
	protected JRadioButton nationalRadioButton;

	protected JComboBox<String> continentComboBox;
	protected JComboBox<String> nationComboBox;
	protected JComboBox<String> teamComboBox;
	protected JComboBox<String> fromYearComboBox;
	protected JComboBox<String> toYearComboBox;

	private final Vector<String> militancyContinentVector = new Vector<>();
	private final Vector<String> militancyNationVector = new Vector<>();
	private final Vector<String> militancyTeamVector = new Vector<>();
	private final Map<String, String> militancyContinentMap = new HashMap<>();
	private final Map<String, String> militancyNationMap = new HashMap<>();
	private final Map<String, String> militancyTeamMap = new HashMap<>();

	protected JLabel label;
	protected ButtonGroup teamTypeButtonGroup;

	private String bookmark = null;

	private String militancyTeamType = null;
	private String militancyContinentID = null;
	private String militancyNationID = null;
	private String militancyTeam = null;


	public MilitancyFilterPanel()
	{

		MigLayout migLayout;
		String string;

		migLayout = new MigLayout
			(
				"debug, flowy",
				"10[grow, fill]10",
				"20[]20[]50[]10"
			);

		setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE TITOLO
		 *------------------------------------------------------------------------------------------------------*/




		string = GuiConfiguration.getMessage("militancyFilter");
		string = string.toUpperCase();

		titleButton = new JButton(string);
		titleButton.setHorizontalTextPosition(SwingConstants.LEADING);
		titleButton.setIcon(maximizeIcon);
		titleButton.setIconTextGap(40);
		titleButton.setCursor(GuiConfiguration.getButtonCursor());

		add(titleButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		titleButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{

				if (militancyPanel.isShowing()) {
					remove(militancyPanel);
					titleButton.setIcon(minimizeIcon);
				}
				else {
					add(militancyPanel, 1);
					titleButton.setIcon(maximizeIcon);
				}

				revalidate();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRO GENERALE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowy",
				"0[grow, fill]0",
				"0[]0[]10[]0[]20[]0"
			);

		militancyPanel = new JPanel(migLayout);
		militancyPanel.setOpaque(false);

		add(militancyPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "1. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]20",
				"10[]10"
			);

		teamTypePanel = new JPanel(migLayout);
		teamTypePanel.setBackground(panelColor);

		militancyPanel.add(teamTypePanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA CLUB
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("club");
		string = StringUtils.capitalize(string);

		clubRadioButton = new JRadioButton(string);
		clubRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(clubRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		clubRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				militancyTeamType = Team.TEAM_TYPE.CLUB.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RADIOBUTTON TIPO SQUADRA NATIONAL
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("national");
		string = StringUtils.capitalize(string);

		nationalRadioButton = new JRadioButton(string);
		nationalRadioButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(nationalRadioButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationalRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				militancyTeamType = Team.TEAM_TYPE.NATIONAL.toString();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTONGROUP PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		teamTypeButtonGroup = new ButtonGroup();

		teamTypeButtonGroup.add(clubRadioButton);
		teamTypeButtonGroup.add(nationalRadioButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER TIPO SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		teamTypeResetButton = new JButton(resetIcon);
		teamTypeResetButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(teamTypeResetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		teamTypeResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				militancyTeamType = null;

				teamTypeButtonGroup.clearSelection();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		string = "2. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("nation");
		string += "/";
		string += GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		militancyPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER PAESE
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, wrap 3, center",
				"50[]80[]80[]20",
				"10[]20[]10"
			);

		countryConfederationPanel = new JPanel(migLayout);
		countryConfederationPanel.setBackground(panelColor);

		militancyPanel.add(countryConfederationPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("continent");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX CONTINENTE
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox = new JComboBox<>();

		continentComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		countryConfederationPanel.add(continentComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		continentComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						continentComboBox,
						militancyContinentVector,
						militancyContinentMap,
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null
					);
			}
			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyContinentID = militancyContinentMap.get((String) continentComboBox.getSelectedItem());

				if ( militancyContinentID != null ) {
					nationComboBox.setEnabled(true);
				}
				else {
					nationComboBox.setEnabled(false);
					nationComboBox.setSelectedIndex(-1);
				}

			}
			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("nation");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		countryConfederationPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX NAZIONE
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox = new JComboBox<>();

		nationComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		nationComboBox.setEnabled(false);

		countryConfederationPanel.add(nationComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		nationComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillCountryComboBox
					(
						nationComboBox,
						militancyNationVector,
						militancyNationMap,
						Country.COUNTRY_TYPE.NATION.toString(),
						militancyContinentID
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyNationID = militancyNationMap.get((String) nationComboBox.getSelectedItem());
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		string = "3. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("team");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);
		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER SQUADRA
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]20",
				"10[]10"
			);

		teamPanel = new JPanel(migLayout);
		teamPanel.setBackground(panelColor);

		add(teamPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL TEAM
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("team");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		teamPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX TEAM
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox = new JComboBox<>();

		teamComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());
		teamComboBox.setSelectedIndex(-1);

		teamComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		teamPanel.add(teamComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		teamComboBox.addPopupMenuListener(new PopupMenuListener() {
			@Override
			public void popupMenuWillBecomeVisible(PopupMenuEvent e)
			{
				fillTeamComboBox
					(
						teamComboBox,
						militancyTeamVector,
						militancyTeamMap,
						null,
						null,
						militancyTeamType,
						militancyContinentID,
						militancyNationID
					);
			}

			@Override
			public void popupMenuWillBecomeInvisible(PopupMenuEvent e)
			{
				militancyTeam = militancyTeamMap.get( (String) teamComboBox.getSelectedItem() );
			}

			@Override
			public void popupMenuCanceled(PopupMenuEvent e) { }
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * RESET BUTTON TEAM PANEL
		 *------------------------------------------------------------------------------------------------------*/



		teamResetButton = new JButton(resetIcon);
		teamResetButton.setCursor(GuiConfiguration.getButtonCursor());

		teamTypePanel.add(teamResetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/




		teamResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				militancyTeam = null;
				teamComboBox.setSelectedIndex(-1);
			}
		});
		/*------------------------------------------------------------------------------------------------------*/


		/*--------------------------------------------------------------------------------------------------------
		 * LABEL FILTRA PER ANNI
		 *------------------------------------------------------------------------------------------------------*/



		string = "4. ";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("years");
		string = string.toUpperCase();

		label = new JLabel(string, SwingConstants.LEADING);

		label.setOpaque(true);
		label.setBackground(GuiConfiguration.getSearchPanelColor());
		label.setForeground(Color.white);
		label.setBorder(GuiConfiguration.getSearchLabelBorder());

		add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * PANEL FILTRA PER ANNI
		 *------------------------------------------------------------------------------------------------------*/



		migLayout = new MigLayout
			(
				"debug, flowx, center",
				"50[]80[]80[]80[]80[]20",
				"10[]10"
			);

		yearPanel = new JPanel(migLayout);
		yearPanel.setBackground(panelColor);

		add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL DA ANNO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("from");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX DA ANNO
		 *------------------------------------------------------------------------------------------------------*/



		fromYearComboBox = new JComboBox<>();

		fromYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		fromYearComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		yearPanel.add(fromYearComboBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL AD ANNO
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("to");
		string += " ";
		string += GuiConfiguration.getMessage("year");
		string = StringUtils.capitalize(string);

		label = new JLabel(string, SwingConstants.LEADING);

		yearPanel.add(label);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX AD ANNO
		 *------------------------------------------------------------------------------------------------------*/



		toYearComboBox = new JComboBox<>();

		toYearComboBox.setMaximumRowCount(GuiConfiguration.getComboBoxMaximumRowCount());

		toYearComboBox.setPrototypeDisplayValue(GuiConfiguration.getDisplayValue());

		yearPanel.add(toYearComboBox);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE DI RESET PER YEAR PANEL
		 *------------------------------------------------------------------------------------------------------*/



		yearResetButton = new JButton(resetIcon);
		yearResetButton.setCursor(GuiConfiguration.getButtonCursor());

		yearPanel.add(yearResetButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		yearResetButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * BOTTONE CERCA
		 *------------------------------------------------------------------------------------------------------*/



		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		searchButton = new JButton(string);

		add(searchButton);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		searchButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				//TODO
			}
		});
	}


	public void fillCountryComboBox(JComboBox<String> comboBox,
									Vector<String> vector,
									Map<String, String> map,
									String type,
									String superCountryID)
	{

		GuiConfiguration.initComboBoxVector(vector, map, false);

		Controller.getInstance().setCountryComboBox
			(
				vector,
				map,
				type,
				superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}
	public void fillTeamComboBox(JComboBox<String> comboBox,
									Vector<String> vector,
									Map<String, String> map,
									String teamSubLongName,
									String teamSubShortName,
									String teamType,
									String teamContinentID,
								 	String teamNationID)
	{

		GuiConfiguration.initComboBoxVector(vector, map, false);

		Controller.getInstance().setTeamComboBox
			(
				vector,
				map,
				teamSubLongName,
				teamSubShortName,
				teamType,
				teamContinentID,
				teamNationID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}
}

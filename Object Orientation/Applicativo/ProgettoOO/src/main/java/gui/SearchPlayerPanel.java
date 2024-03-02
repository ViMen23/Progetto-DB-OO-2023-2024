package gui;

import controller.Controller;
import model.Country;
import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class SearchPlayerPanel
							extends JPanel
{

	public SearchPlayerPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlPlayerSubName = new JLabel((String) null);
		final JLabel ctrlPlayerSubSurname = new JLabel((String) null);
		final JLabel ctrlReferenceYear = new JLabel((String) null);
		final JLabel ctrlPlayerMinAge = new JLabel((String) null);
		final JLabel ctrlPlayerMaxAge = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);
		final JLabel ctrlPlayerRole = new JLabel((String) null);
		final JLabel ctrlPlayerPosition = new JLabel(selectAll);
		final JLabel ctrlPlayerFoot = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();


		final Vector<Vector<String>> playerTableData = new Vector<>();
		final Map<Integer, String> playerTableDataMap = new HashMap<>();

		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		InfoPanel infoPanel;
		TitleLabel titleLabel;
		LabelTextPanel playerNamePanel;
		LabelTextPanel playerSurnamePanel;
		LabelComboPanel referringYearPanel;
		LabelComboPanel playerMinAgePanel;
		LabelComboPanel playerMaxAgePanel;
		LabelComboPanel continentTypeNamePanel;
		LabelComboPanel nationTypeNamePanel;
		PlayerRoleCheckPanel playerRolePanel;
		LabelComboPanel playerPositionPanel;
		RadioPanel playerFootPanel;
		TablePanel playerTablePanel;
		JButton button;

		String string;

		migLayout = new MigLayout(
						GuiConfiguration.VFILL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.DEBUG_WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.THIRTEEN_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("players");
		string += " - ";
		string += GuiConfiguration.getMessage("players");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countPlayers().toString();
		string = string.toUpperCase();


		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		playerNamePanel = new LabelTextPanel(string, ctrlPlayerSubName, Regex.patternString);
		centralPanel.add(playerNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		playerSurnamePanel = new LabelTextPanel(string, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlPlayerSubSurname, Regex.patternString);
		centralPanel.add(playerSurnamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		referringYearPanel = new LabelComboPanel(string, true, ctrlReferenceYear);
		centralPanel.add(referringYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("minimumAge");
		string = StringUtils.capitalize(string);

		playerMinAgePanel = new LabelComboPanel(string, false,  GuiConfiguration.ONE_CELL_GAP_0_10, ctrlPlayerMinAge);
		centralPanel.add(playerMinAgePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("maximumAge");
		string = StringUtils.capitalize(string);

		playerMaxAgePanel = new LabelComboPanel(string, false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlPlayerMaxAge);
		centralPanel.add(playerMaxAgePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		string = Country.COUNTRY_TYPE.CONTINENT.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		continentTypeNamePanel = new LabelComboPanel(string, true, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		string = Country.COUNTRY_TYPE.NATION.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		nationTypeNamePanel = new LabelComboPanel(string, false, GuiConfiguration.ONE_CELL_GAP_0_10, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerRolePanel = new PlayerRoleCheckPanel(ctrlPlayerRole);
		centralPanel.add(playerRolePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il quarto info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("mainPosition");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		string = GuiConfiguration.getMessage("position");
		string = StringUtils.capitalize(string);

		playerPositionPanel = new LabelComboPanel(string, true, ctrlPlayerPosition);
		centralPanel.add(playerPositionPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il quinto info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("preferredFoot");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerFootPanel = new RadioPanel(Player.FOOT_TYPE.values(), ctrlPlayerFoot);
		centralPanel.add(playerFootPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel("Questo e' il sesto info box");
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, null, null, null);
		this.add(playerTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				playerTableData.clear();

				Controller.getInstance().setPlayerTable(
								ctrlPlayerSubName.getText(),
								ctrlPlayerSubSurname.getText(),
								ctrlReferenceYear.getText(),
								ctrlPlayerMinAge.getText(),
								ctrlPlayerMaxAge.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								ctrlPlayerRole.getText(),
								positionNameMap.get(ctrlPlayerPosition.getText()),
								ctrlPlayerFoot.getText(),
								playerTableData,
								playerTableDataMap
				);

				playerTablePanel.getMyTable().setModel(new TableModel(playerTableData, GuiConfiguration.PLAYER_TABLE_COLUMN_NAME));

				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("players");
				string += " - ";
				string += playerTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("players");
				string = string.toUpperCase();

				playerTablePanel.getTitleLabel().setText(string);

				SearchPlayerPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlReferenceYear.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlReferenceYear.getText(), "@fill")) {

					JComboBox<String> comboBox = referringYearPanel.getMyComboBox();

					comboBox.removeAllItems();

					int maximumYear = Year.now().getValue();
					int minimumYear = GuiConfiguration.MIN_YEAR;

					for (int i = maximumYear; i >= minimumYear; --i){
						comboBox.addItem(String.valueOf(i));
					}

					System.out.println("ciao");
				}
				else {
					playerMinAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMinAgePanel.getMyComboBox().setEnabled(true);
					ctrlPlayerMinAge.setText(null);

					playerMaxAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMaxAgePanel.getMyComboBox().setEnabled(false);
					ctrlPlayerMaxAge.setText(null);
				}
			}
		});


		ctrlPlayerMinAge.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				System.out.println("ciao  " + ctrlPlayerMinAge.getText());
				if (0 == StringUtils.compareIgnoreCase(ctrlPlayerMinAge.getText(), "@fill")) {

					JComboBox<String> comboBox = playerMinAgePanel.getMyComboBox();

					comboBox.removeAllItems();

					int minAge = GuiConfiguration.MIN_AGE;
					int maxAge = GuiConfiguration.MAX_AGE;

					for (int i = minAge; i <= maxAge; ++i) {
						comboBox.addItem(String.valueOf(i));
					}
				}
				else if (null != ctrlPlayerMinAge.getText()){
					playerMaxAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMaxAgePanel.getMyComboBox().setEnabled(true);
					ctrlPlayerMaxAge.setText(null);
				}
			}
		});


		ctrlPlayerMaxAge.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPlayerMaxAge.getText(), "@fill")) {

					JComboBox<String> comboBox = playerMaxAgePanel.getMyComboBox();

					comboBox.removeAllItems();

					int minAge = Integer.parseInt(ctrlPlayerMinAge.getText());
					int maxAge = GuiConfiguration.MAX_AGE;

					for (int i = minAge; i <= maxAge; ++i) {
						comboBox.addItem(String.valueOf(i));
					}
				}

			}
		});
		ctrlContinentName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlContinentName.getText().equalsIgnoreCase("@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					continentNameVector.add(selectAll);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));

				} else if (ctrlContinentName.getText().equalsIgnoreCase(selectAll)) {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(false);
					ctrlNationName.setText(selectAll);
				} else {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(true);
					ctrlNationName.setText(selectAll);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlNationName.getText().equalsIgnoreCase("@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					nationNameVector.add(selectAll);

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
			}
		});

		ctrlPlayerPosition.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlPlayerPosition.getText().equalsIgnoreCase("@fill")) {

					positionNameVector.clear();
					positionNameMap.clear();

					positionNameVector.add(selectAll);

					Controller.getInstance().setPositionComboBox(positionNameVector, positionNameMap);

					playerPositionPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(positionNameVector));
				}
			}
		});
	}
}

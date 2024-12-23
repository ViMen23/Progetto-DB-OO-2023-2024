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

/**
 * Questa classe rappresenta un pannello per la ricerca di calciatori.
 * Offre vari filtri di ricerca. I risultati della ricerca
 * vengono visualizzati in una tabella. Il pannello permette anche di
 * visualizzare informazioni di riepilogo sulla ricerca effettuata.
 * Permette di cliccare sulla tabella per ottenere maggiori informazioni sui calciatori.
 */
public class SearchPlayerPanel
							extends JPanel
{

	public SearchPlayerPanel(Boolean admin)
	{
		final JLabel ctrlPlayerSubName = new JLabel((String) null);
		final JLabel ctrlPlayerSubSurname = new JLabel((String) null);
		final JLabel ctrlReferenceYear = new JLabel((String) null);
		final JLabel ctrlPlayerMinAge = new JLabel((String) null);
		final JLabel ctrlPlayerMaxAge = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlPlayerRole = new JLabel((String) null);
		final JLabel ctrlPlayerPosition = new JLabel((String) null);
		final JLabel ctrlPlayerFoot = new JLabel((String) null);

		final Integer[] tableIndex = {-1, -1};
		final JLabel ctrlMouseTable = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();

		final Vector<Vector<String>> playerTableData = new Vector<>();
		final Map<Integer, Map<Integer, String>> playerTableDataMap = new HashMap<>();

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
						GuiConfiguration.WRAP_2_LAYOUT_CONSTRAINT,
						GuiConfiguration.TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT,
						GuiConfiguration.THIRTEEN_CELL_LAYOUT_CONSTRAINT
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("searchPlayers");
		string += " - ";
		string += GuiConfiguration.getMessage("availablePlayers");
		string += " ";
		string += Controller.getInstance().countPlayers().toString();
		topSearchPanel = new TopSearchPanel(string, this, centralPanel, true);
		this.add(topSearchPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT);

		this.add(centralPanel, GuiConfiguration.HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("name").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerNamePanel = new LabelTextPanel(
						GuiConfiguration.getMessage("name"),
						ctrlPlayerSubName,
						Regex.patternString
		);
		centralPanel.add(playerNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		playerSurnamePanel = new LabelTextPanel(
						GuiConfiguration.getMessage("surname"),
						GuiConfiguration.ONE_CELL_GAP_0_10_LAYOUT_CONSTRAINT,
						ctrlPlayerSubSurname,
						Regex.patternString
		);
		centralPanel.add(playerSurnamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);


		infoPanel = new InfoPanel(GuiConfiguration.getMessage("namesInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("age"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);


		referringYearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("referenceYear"),
						true,
						ctrlReferenceYear
		);
		centralPanel.add(referringYearPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT);


		playerMinAgePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("minAge"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10_LAYOUT_CONSTRAINT,
						ctrlPlayerMinAge
		);
		centralPanel.add(playerMinAgePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT);


		playerMaxAgePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("maxAge"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10_LAYOUT_CONSTRAINT,
						ctrlPlayerMaxAge
		);
		centralPanel.add(playerMaxAgePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("ageInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("bornCountry"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		continentTypeNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT);

		nationTypeNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						false,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_10_LAYOUT_CONSTRAINT,
						ctrlNationName
		);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("nationInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("role"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerRolePanel = new PlayerRoleCheckPanel(ctrlPlayerRole);
		centralPanel.add(playerRolePanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("roleInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("mainPosition"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerPositionPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("position"),
						true,
						ctrlPlayerPosition
		);
		centralPanel.add(playerPositionPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("positionInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("foot").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("info"));
		centralPanel.add(titleLabel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);

		playerFootPanel = new RadioPanel(Player.FOOT_TYPE.values(), ctrlPlayerFoot);
		centralPanel.add(playerFootPanel, GuiConfiguration.HGROUP_FIRST_COLUMN_ADD_CONSTRAINT);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("footInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.HGROUP_SECOND_COLUMN_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, tableIndex, ctrlMouseTable);
		this.add(playerTablePanel, GuiConfiguration.HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT);

		button = new JButton(GuiConfiguration.getMessage("search"));

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable playerTable = playerTablePanel.getMyTable();
				String string;

				playerTableData.clear();
				playerTableDataMap.clear();


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

				playerTable.setModel(new TableModel(playerTableData, GuiConfiguration.PLAYER_TABLE_COLUMN_NAME));
				playerTable.setPreferredScrollableViewportSize(playerTable.getPreferredSize());

				playerTable.getColumnModel().getColumn(0).setCellRenderer(new TableRenderer());

				string = GuiConfiguration.getMessage("doneSearch");
				string += " - ";
				string += GuiConfiguration.getMessage("players");
				string += " ";
				string += playerTableData.size();
				playerTablePanel.getTitleLabel().setText(string);

				//messaggio informazioni ricerca effettuata
				string = "";

				if (ctrlPlayerSubName.getText() != null) {
					string += GuiConfiguration.getMessage("name").toUpperCase();
					string += ": ";
					string += ctrlPlayerSubName.getText();
				}

				if (ctrlPlayerSubSurname.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("surname").toUpperCase();
					string += ": ";
					string += ctrlPlayerSubSurname.getText();
				}

				if (ctrlReferenceYear.getText() != null && ctrlPlayerMinAge.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("referenceYear").toUpperCase();
					string += ": ";
					string += ctrlReferenceYear.getText();

					string += "\n";
					string += GuiConfiguration.getMessage("age");
					string += ": ";
					string += ctrlPlayerMinAge.getText();
					string += " - ";

					if (ctrlPlayerMaxAge.getText() != null) {
						string += ctrlPlayerMaxAge.getText();
					} else {
						string += Player.MAX_AGE;
					}
				}

				if (continentNameMap.get(ctrlContinentName.getText()) != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("country");
					string += ": ";
					string += ctrlContinentName.getText();

					if (nationNameMap.get(ctrlNationName.getText()) != null) {
						string += " - ";
						string += ctrlNationName.getText();
					}
				}

				if (ctrlPlayerRole.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}
					string += GuiConfiguration.getMessage("role");
					string += ": ";

					String[] keyPart = ctrlPlayerRole.getText().split("_");

					string += GuiConfiguration.getMessage(keyPart[0]);

					for (int i = 1; i < keyPart.length; ++i) {
						string += ", ";
						string += GuiConfiguration.getMessage(keyPart[i]);
					}
				}

				if (positionNameMap.get(ctrlPlayerPosition.getText()) != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}

					string += GuiConfiguration.getMessage("position").toUpperCase();
					string += ": ";
					string += ctrlPlayerPosition.getText();
				}

				if (ctrlPlayerFoot.getText() != null) {
					if (!string.isEmpty()) {
						string += "\n";
					}

					string += GuiConfiguration.getMessage("foot").toUpperCase();
					string +=  ": ";
					string += GuiConfiguration.getMessage(ctrlPlayerFoot.getText());
				}

				playerTablePanel.getTextArea().setText(string);

				topSearchPanel.getTitleButton().doClick();
				SearchPlayerPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.SPAN_2_ADD_CONSTRAINT);


		ctrlReferenceYear.addPropertyChangeListener("text", new PropertyChangeListener() {
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
				} else {
					playerMinAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMaxAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMinAgePanel.getMyComboBox().setEnabled(true);
					playerMaxAgePanel.getMyComboBox().setEnabled(false);
					ctrlPlayerMinAge.setText(null);
					ctrlPlayerMaxAge.setText(null);
				}
			}
		});


		ctrlPlayerMinAge.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPlayerMinAge.getText(), "@fill")) {
					JComboBox<String> comboBox = playerMinAgePanel.getMyComboBox();

					comboBox.removeAllItems();

					int minAge = Player.MIN_AGE;
					int maxAge = Player.MAX_AGE;

					for (int i = minAge; i <= maxAge; ++i) {
						comboBox.addItem(String.valueOf(i));
					}
				} else if (null != ctrlPlayerMinAge.getText()) {
					playerMaxAgePanel.getMyComboBox().setSelectedIndex(-1);
					playerMaxAgePanel.getMyComboBox().setEnabled(true);
					ctrlPlayerMaxAge.setText(null);
				}
			}
		});


		ctrlPlayerMaxAge.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPlayerMaxAge.getText(), "@fill")) {
					JComboBox<String> comboBox = playerMaxAgePanel.getMyComboBox();

					comboBox.removeAllItems();

					int minAge = Integer.parseInt(ctrlPlayerMinAge.getText());
					int maxAge = Player.MAX_AGE;

					for (int i = minAge; i <= maxAge; ++i) {
						comboBox.addItem(String.valueOf(i));
					}
				}
			}
		});

		ctrlContinentName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlContinentName.getText(), "@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					continentNameVector.add(GuiConfiguration.getMessage("selectAll"));

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					if (1 == continentNameVector.size()) {
						continentNameVector.clear();
						continentNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					continentTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationTypeNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationTypeNamePanel.getMyComboBox().setEnabled(continentNameMap.get(ctrlContinentName.getText()) != null);
					ctrlNationName.setText(null);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlNationName.getText(), "@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();

					nationNameVector.add(GuiConfiguration.getMessage("selectAll"));

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					if (1 == nationNameVector.size()) {
						nationNameVector.clear();
						nationNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					nationTypeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
			}
		});

		ctrlPlayerPosition.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPlayerPosition.getText(), "@fill")) {
					positionNameVector.clear();
					positionNameMap.clear();

					positionNameVector.add(GuiConfiguration.getMessage("selectAll"));

					Controller.getInstance().setPositionComboBox(positionNameVector, positionNameMap);

					if (1 == positionNameVector.size()) {
						positionNameVector.clear();
						positionNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					playerPositionPanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(positionNameVector));
				}
			}
		});

		ctrlMouseTable.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlMouseTable.getText().equalsIgnoreCase("@click")) {
					try {
						String playerID;
						JPanel panel;

						playerID = playerTableDataMap.get(tableIndex[1]).get(tableIndex[0]);


						if (admin) {
							panel = new AdminNavigationPanel(new AdminViewPlayerUpdateGeneralInfo(playerID));
						}
						else {
							panel = new MenuBarPanel(new ViewPlayerGeneralInfo(playerID));
						}

						SearchPlayerPanel.this.getParent().setVisible(false);
						MainFrame.getMainFrameInstance().getContentPane().remove(SearchPlayerPanel.this.getParent());

						MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					} catch (Exception ignored) {
					} finally {
						ctrlMouseTable.setText("@null");
					}
				}
			}
		});
	}
}

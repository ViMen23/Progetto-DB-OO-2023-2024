package gui;

import controller.Controller;
import model.Country;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.*;

public class SearchConfederationPanel
	extends JPanel
{
	public SearchConfederationPanel()
	{
		final String selectAll = GuiConfiguration.getMessage("selectAll");
		final StringBuilder researchMessage = new StringBuilder();

		final JLabel ctrlCountryType = new JLabel((String) null);
		final JLabel ctrlConfederationName = new JLabel(selectAll);

		final Vector<String> confederationNameVector = new Vector<>();
		final Map<String, String> confederationNameMap = new HashMap<>();

		final Vector<Vector<String>> confederationTableData = new Vector<>();


		MigLayout migLayout;
		TopSearchPanel topSearchPanel;
		TitleLabel titleLabel;
		RadioPanel countryTypePanel;
		InfoPanel infoPanel;
		LabelComboPanel confederationNamePanel;
		TablePanel confederationTablePanel;
		JButton button;


		migLayout = new MigLayout(
			GuiConfiguration.generalSearchPanelLayoutConstraint,
			GuiConfiguration.generalSearchPanelColumnConstraint,
			GuiConfiguration.generalSearchPanelRowConstraint
		);

		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
			GuiConfiguration.middleSearchPanelLayoutConstraint,
			GuiConfiguration.middleSearchPanelColumnConstraint,
			GuiConfiguration.middleSearchPanelRowConstraint
		);

		centralPanel.setLayout(migLayout);

		topSearchPanel = new TopSearchPanel(
						GuiConfiguration.getMessage("msgTopSearchConfederationButton") + " " + Controller.getInstance().countConfederations().toString(),
						this,
						centralPanel
		);
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("confederationType").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		countryTypePanel = new RadioPanel(Country.COUNTRY_TYPE.values(), ctrlCountryType);
		centralPanel.add(countryTypePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("msgChooseConfederationTypeInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("continentalConfederation").toUpperCase());
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgInfo"));
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		confederationNamePanel = new LabelComboPanel(null, false, ctrlConfederationName);
		centralPanel.add(confederationNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel(GuiConfiguration.getMessage("msgChooseContinentConfederationInfo"));
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		confederationTablePanel = new TablePanel(true, null);
		this.add(confederationTablePanel, GuiConfiguration.tablePanelAddConstraint);


		button = new JButton(GuiConfiguration.getMessage("msgSearchButton"));
		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				MyTable countryTable = confederationTablePanel.getMyTable();

				confederationTableData.clear();

				Controller.getInstance().setConfederationTable(
								ctrlCountryType.getText(),
								confederationNameMap.get(ctrlConfederationName.getText()),
								confederationTableData
				);

				countryTable.setModel(new TableModel(confederationTableData, GuiConfiguration.countryTableColumnName));
				countryTable.setPreferredScrollableViewportSize(countryTable.getPreferredSize());

				confederationTablePanel.getTitleLabel().setText(
								GuiConfiguration.getMessage("msgDoneSearch") + " " + confederationTableData.size()
				);

				confederationTablePanel.getTextArea().setText(researchMessage.toString());
				topSearchPanel.getTitleButton().doClick();
				SearchConfederationPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);


		ctrlCountryType.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlCountryType.getText(), Country.COUNTRY_TYPE.NATION.toString())) {
					confederationNamePanel.getMyComboBox().setEnabled(true);
				} else {
					confederationNamePanel.getMyComboBox().setEnabled(false);
					confederationNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlConfederationName.setText(selectAll);
				}
				researchMessage.setLength(0);
				researchMessage.append(GuiConfiguration.getMessage("confederationType")).append(": ");
				researchMessage.append(GuiConfiguration.getMessage(ctrlCountryType.getText()));
			}
		});

		ctrlConfederationName.addPropertyChangeListener(new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (ctrlConfederationName.getText().equalsIgnoreCase("@fill")) {
					confederationNameVector.clear();
					confederationNameMap.clear();

					confederationNameVector.add(selectAll);

					Controller.getInstance().setConfederationComboBox(
						Country.COUNTRY_TYPE.CONTINENT.toString(),
						null,
						confederationNameVector,
						confederationNameMap
					);

					if (1 == confederationNameVector.size()) {
						confederationNameVector.clear();
						confederationNameVector.add(GuiConfiguration.getMessage("msgNoData"));
						confederationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
						confederationNamePanel.getMyComboBox().setEnabled(false);
						confederationNamePanel.getMyComboBox().setSelectedIndex(0);
					}

					confederationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(confederationNameVector));
				} else {
					researchMessage.setLength(0);
					researchMessage.append(GuiConfiguration.getMessage("countryType")).append(": ");
					researchMessage.append(GuiConfiguration.getMessage(ctrlCountryType.getText()));
					researchMessage.append('\n').append(GuiConfiguration.getMessage("continentalConfederation")).append(": ");
					researchMessage.append(ctrlConfederationName.getText());
				}
			}
		});
	}
}
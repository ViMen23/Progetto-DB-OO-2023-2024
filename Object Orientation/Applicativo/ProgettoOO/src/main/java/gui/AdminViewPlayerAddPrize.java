package gui;

import controller.Controller;
import model.Country;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerAddPrize
				extends JPanel
{
	public AdminViewPlayerAddPrize(String playerID)
	{
		final JLabel ctrlYear = new JLabel((String) null);
		final JLabel ctrlPrizeName = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> prizeNameVector = new Vector<>();
		final Map<String, String> prizeNameMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel yearPanel;
		LabelComboPanel prizeNamePanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addPrize"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		yearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("year"),
						true,
						ctrlYear
		);

		this.add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/

		prizeNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("prize"),
						false,
						ctrlPrizeName
		);

		this.add(prizeNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

				//TODO
//				String message = Controller.getInstance().createPlayerPosition(playerID, positionNameMap.get(ctrlPositionName.getText()));
//
//				System.out.println(message);
			}
		});

		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {

					MyComboBox yearCombo = yearPanel.getMyComboBox();
					int dYear = Year.now().getValue();

					yearCombo.removeAllItems();

					for (int i = GuiConfiguration.MIN_YEAR; i < dYear;  ++i) {
						yearCombo.addItem(String.valueOf(i));
					}
				} else {
					prizeNamePanel.getMyComboBox().setEnabled(null != ctrlYear.getText());
					prizeNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlPrizeName.setText(null);
				}
			}
		});

		ctrlPrizeName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPrizeName.getText(), "@fill")) {
					prizeNameVector.clear();
					prizeNameMap.clear();


					//TODO Controller.getInstance().


					if (prizeNameVector.isEmpty()) {
						prizeNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					prizeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(prizeNameVector));
				} else {
					confirmButton.setEnabled(null != prizeNameMap.get(ctrlPrizeName.getText()));
				}
			}
		});

	}

}
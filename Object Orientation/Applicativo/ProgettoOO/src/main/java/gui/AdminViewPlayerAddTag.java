package gui;

import controller.Controller;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewPlayerAddTag
				extends JPanel
{
	public AdminViewPlayerAddTag(String playerID)
	{
		final JLabel ctrlTagName = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> tagNameVector = new Vector<>();
		final Map<String, String> tagNameMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel tagNamePanel;
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

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addPlayerTag"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		tagNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("tag"),
						true,
						ctrlTagName
		);

		this.add(tagNamePanel);
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

		ctrlTagName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTagName.getText(), "@fill")) {
					tagNameVector.clear();
					tagNameMap.clear();

					//Controller.getInstance().setTagComboBox(tagNameVector, tagNameMap);

					if (tagNameVector.isEmpty()) {
						tagNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					tagNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(tagNameVector));
				}
				else {
					confirmButton.setEnabled(null != tagNameMap.get(ctrlTagName.getText()));
				}
			}
		});
	}

}

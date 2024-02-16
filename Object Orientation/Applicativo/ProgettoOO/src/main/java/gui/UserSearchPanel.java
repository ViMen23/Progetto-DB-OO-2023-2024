/*
package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;
*/
/*
public class UserSearchPanel
				extends  JPanel
				implements ActionListener, CaretListener, ItemListener
{
	protected JTabbedPane searchTabbedPane;
	protected JPanel competitionSearchPanel;
	protected JPanel teamSearchPanel;
	protected JPanel playerSearchPanel;
	final static float outputFontSize = 22;

	protected JButton tmp;

	public UserSearchPanel(Controller controller, ResourceBundle currentLocale)
	{

		setLayout(new GridBagLayout());

		Font outputFont = this.getFont().deriveFont(outputFontSize);

		GridBagConstraints gbc;

		searchTabbedPane = new JTabbedPane(JTabbedPane.TOP, JTabbedPane.WRAP_TAB_LAYOUT);

		searchTabbedPane.addTab
						(
										currentLocale.getString("competition").toUpperCase(),
										new UserSearchCompetitionPanel(controller, currentLocale)
						);

		searchTabbedPane.addTab
						(
										currentLocale.getString("team").toUpperCase(),
										new UserSearchTeamPanel(controller, currentLocale)
						);

		searchTabbedPane.addTab
						(
										currentLocale.getString("player").toUpperCase(),
										new UserSearchPlayerPanel(controller, currentLocale)
						);

		searchTabbedPane.addTab
						(
										currentLocale.getString("stepFilter").toUpperCase(),
										new UserStepFilterPanel(controller, currentLocale));

		searchTabbedPane.setFont(outputFont);



		gbc = new GridBagConstraints();
		gbc.fill = GridBagConstraints.BOTH;
		gbc.gridy = 1;

		add(searchTabbedPane, gbc);


	}


	@Override
	public void actionPerformed(ActionEvent e) {

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}
}
*/
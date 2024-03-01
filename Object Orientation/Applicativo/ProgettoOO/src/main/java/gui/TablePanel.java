package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.Vector;

public class TablePanel
				extends JPanel
{
	private final TitleLabel titleLabel;
	private final MyScrollPane myScrollPane;

	public TablePanel(Boolean sort,
										JLabel controlColumnLabel,
										JLabel controlRowLabel,
										JLabel controlMouseLabel)
	{
		MigLayout migLayout;
		String string;

		migLayout = new MigLayout(
						GuiConfiguration.tablePanelLayoutConstraint,
						GuiConfiguration.tablePanelColumnConstraint,
						GuiConfiguration.tablePanelRowConstraint
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		string = GuiConfiguration.getMessage("no");
		string += " ";
		string += GuiConfiguration.getMessage("research");
		string += " ";
		string += GuiConfiguration.getMessage("performed");
		string = string.toUpperCase();


		this.titleLabel = new TitleLabel(string);
		this.add(titleLabel);


		this.myScrollPane = new MyScrollPane(sort, controlColumnLabel, controlRowLabel, controlMouseLabel);
		this.add(myScrollPane);
	}

	public void fillTable(Vector<Vector<String>> tableData, Vector<String> tableColumnName)
	{

		MyTable myTable = this.myScrollPane.getMyTable();
		myTable.setModel(new TableModel(tableData, tableColumnName));

		myTable.setPreferredScrollableViewportSize(myTable.getPreferredSize());
	}

	public void setTextTitleLabel(String title)
	{
		this.titleLabel.setText(title);
	}
}

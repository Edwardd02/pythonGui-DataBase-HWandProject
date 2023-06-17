# -*- coding: utf-8 -*-
import re

# Form implementation generated from reading ui file '.\Exercise05.ui'
#
# Created by: PyQt5 UI code generator 5.15.9
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.

#############################################################
#                                                           #
#                       UI Generation                       #
#                                                           #
#############################################################

from PyQt5 import QtCore, QtGui, QtWidgets
import mysql.connector


class Ui_Dialog(object):
    def setupUi(self, Dialog, listValues):
        Dialog.setObjectName("Expense")
        Dialog.resize(334, 252)
        self.buttonBox = QtWidgets.QDialogButtonBox(Dialog)
        self.buttonBox.setGeometry(QtCore.QRect(20, 210, 291, 31))
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.formLayoutWidget = QtWidgets.QWidget(Dialog)
        self.formLayoutWidget.setGeometry(QtCore.QRect(10, 10, 311, 191))
        self.formLayoutWidget.setObjectName("formLayoutWidget")
        self.formLayout = QtWidgets.QFormLayout(self.formLayoutWidget)
        self.formLayout.setLabelAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.formLayout.setContentsMargins(0, 0, 0, 0)
        self.formLayout.setObjectName("formLayout")
        self.lblExpenseID = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblExpenseID.setObjectName("lblExpenseID")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.lblExpenseID)
        self.txtExpenseID = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtExpenseID.setReadOnly(True)
        self.txtExpenseID.setObjectName("txtExpenseID")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.txtExpenseID)
        self.lblCategory = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblCategory.setObjectName("lblCategory")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.lblCategory)
        self.cmbCategory = QtWidgets.QComboBox(self.formLayoutWidget)
        self.cmbCategory.setObjectName("cmbCategory")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.cmbCategory)
        self.lblExpenseDate = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblExpenseDate.setObjectName("lblExpenseDate")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.lblExpenseDate)
        self.dateEdit = QtWidgets.QDateEdit(self.formLayoutWidget)
        self.dateEdit.setCalendarPopup(True)
        self.dateEdit.setDate(QtCore.QDate.currentDate())
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.dateEdit)
        self.dateEdit.setObjectName("cldExpenseDate")
        self.txtExpense = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtExpense.setObjectName("txtExpense")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.txtExpense)
        self.lblAmount = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblAmount.setObjectName("lblAmount")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.LabelRole, self.lblAmount)
        self.lblExpense = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblExpense.setObjectName("lblExpense")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.lblExpense)
        self.txtAmount = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtAmount.setObjectName("txtAmount")
        self.formLayout.setWidget(4, QtWidgets.QFormLayout.FieldRole, self.txtAmount)
        self.lblNotes = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblNotes.setObjectName("lblNotes")
        self.formLayout.setWidget(5, QtWidgets.QFormLayout.LabelRole, self.lblNotes)
        self.txtNotes = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtNotes.setObjectName("txtNotes")
        self.formLayout.setWidget(5, QtWidgets.QFormLayout.FieldRole, self.txtNotes)


        self.retranslateUi(Dialog)
        self.buttonBox.accepted.connect(Dialog.accept) # type: ignore
        self.buttonBox.rejected.connect(Dialog.reject) # type: ignore
        QtCore.QMetaObject.connectSlotsByName(Dialog)

        # Update UI here
        self.listValues = listValues
        self.initialSetup()

    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.lblExpenseID.setText(_translate("Dialog", "Expense ID:"))
        self.lblCategory.setText(_translate("Dialog", "Category ID:"))
        self.lblExpenseDate.setText(_translate("Dialog", "Expense date:"))
        self.lblAmount.setText(_translate("Dialog", "Amount:"))
        self.lblExpense.setText(_translate("Dialog", "Expense:"))
        self.lblNotes.setText(_translate("Dialog", "Notes:"))

##################### End UI Generation ###################

#############################################################
#                                                           #
#                          Events                           #
#                                                           #
#############################################################

    def initialSetup(self):
        self.setValues()
        self.setupComboBox()
        self.setupDatabase()



    def setupComboBox(self, categories = []):
        self.cmbCategory.clear()
        for category in categories:
            category = re.sub(r'[^a-zA-Z0-9]', '', str(category))
            self.cmbCategory.addItem(category)


    def setValues(self):
        if self.listValues == None:     #No list
            return

        self.txtExpenseID.setText(self.listValues[0])
        self.cmbCategory.setCurrentText(self.listValues[1])
        self.dateEdit.setDate(self.listValues[2])
        self.txtExpense.setText(self.listValues[3])
        self.txtAmount.setText(self.listValues[4])
        self.txtNotes.setText(self.listValues[5])


    def getValues(self):
        listResult = []
        listResult.append(self.txtExpenseID.text())
        listResult.append(self.cmbCategory.currentText())
        listResult.append(self.dateEdit.date().toString("yyyy-MM-dd"))
        listResult.append(self.txtExpense.text())
        listResult.append(self.txtAmount.text())
        listResult.append(self.txtNotes.text())
        return listResult


##################### End Events ###################


#############################################################
#                                                           #
#                          Database                         #
#                                                           #
#############################################################

    def setupDatabase(self):
        self.connect()
        self.refresh()


    def connect(self):
        self.cnx = mysql.connector.connect(user="root",
                                           password="222488842dahy",
                                           host="127.0.0.1",
                                           database="homework04")

    def refresh(self):


        # Create a cursor object to execute queries
        cursor = self.cnx.cursor()

        # Execute a query to retrieve data
        query = "Select category from Categories"
        cursor.execute(query)

        # Fetch all the rows returned by the query
        rows = cursor.fetchall()

        if not rows:
            cursor.close()
            return
        print(rows)
        self.setupComboBox(rows)
        # Process the data


        # Close the cursor and the database connection
        cursor.close()
if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog, None)
    Dialog.show()
    sys.exit(app.exec_())

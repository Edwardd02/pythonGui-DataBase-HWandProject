# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'Student.ui'
#
# Created by: PyQt5 UI code generator 5.15.7
#
# WARNING: Any manual changes made to this file will be lost when pyuic5 is
# run again.  Do not edit this file unless you know what you are doing.

#############################################################
#                                                           #
#                       UI Generation                       #
#                                                           #
#############################################################

from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_Dialog(object):
    def setupUi(self, Dialog, listValues):
        Dialog.setObjectName("Dialog")
        Dialog.resize(272, 199)
        self.buttonBox = QtWidgets.QDialogButtonBox(Dialog)
        self.buttonBox.setGeometry(QtCore.QRect(10, 150, 251, 32))
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.formLayoutWidget = QtWidgets.QWidget(Dialog)
        self.formLayoutWidget.setGeometry(QtCore.QRect(10, 20, 251, 131))
        self.formLayoutWidget.setObjectName("formLayoutWidget")
        self.formLayout = QtWidgets.QFormLayout(self.formLayoutWidget)
        self.formLayout.setLabelAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.formLayout.setContentsMargins(0, 0, 0, 0)
        self.formLayout.setObjectName("formLayout")
        self.lblStudentID = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblStudentID.setObjectName("lblStudentID")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.LabelRole, self.lblStudentID)
        self.lblStudentFirstName = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblStudentFirstName.setObjectName("lblStudentFirstName")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.LabelRole, self.lblStudentFirstName)
        self.txtStudentID = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtStudentID.setObjectName("txtStudentID")
        self.formLayout.setWidget(0, QtWidgets.QFormLayout.FieldRole, self.txtStudentID)
        self.txtStudentFirstName = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtStudentFirstName.setObjectName("txtStudentFirstName")
        self.formLayout.setWidget(1, QtWidgets.QFormLayout.FieldRole, self.txtStudentFirstName)
        self.lblStudentLastName = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblStudentLastName.setObjectName("lblStudentLastName")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.LabelRole, self.lblStudentLastName)
        self.txtStudentLastName = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtStudentLastName.setObjectName("txtStudentLastName")
        self.formLayout.setWidget(2, QtWidgets.QFormLayout.FieldRole, self.txtStudentLastName)
        self.txtStudentEmail = QtWidgets.QLineEdit(self.formLayoutWidget)
        self.txtStudentEmail.setObjectName("txtStudentEmail")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.FieldRole, self.txtStudentEmail)
        self.lblStudentEmail = QtWidgets.QLabel(self.formLayoutWidget)
        self.lblStudentEmail.setMouseTracking(False)
        self.lblStudentEmail.setAlignment(QtCore.Qt.AlignLeading|QtCore.Qt.AlignLeft|QtCore.Qt.AlignVCenter)
        self.lblStudentEmail.setObjectName("lblStudentEmail")
        self.formLayout.setWidget(3, QtWidgets.QFormLayout.LabelRole, self.lblStudentEmail)

        self.retranslateUi(Dialog)
        self.buttonBox.accepted.connect(Dialog.accept) # type: ignore
        self.buttonBox.rejected.connect(Dialog.reject) # type: ignore
        QtCore.QMetaObject.connectSlotsByName(Dialog)

        # Update UI Here
        self.listValues = listValues
        self.initialSetup()
    def retranslateUi(self, Dialog):
        _translate = QtCore.QCoreApplication.translate
        Dialog.setWindowTitle(_translate("Dialog", "Dialog"))
        self.lblStudentID.setText(_translate("Dialog", "Student ID:"))
        self.lblStudentFirstName.setText(_translate("Dialog", "First Name:"))
        self.lblStudentLastName.setText(_translate("Dialog", "Last Name:"))
        self.lblStudentEmail.setText(_translate("Dialog", "Email:"))

    ##################### End UI Generation ###################

    def initialSetup(self):
        self.setValues()

    def setValues(self):
        if self.listValues == None:     #No list
            return

        self.txtStudentID.setText(self.listValues[0])
        self.txtStudentFirstName.setText(self.listValues[1])
        self.txtStudentLastName.setText(self.listValues[2])
        self.txtStudentEmail.setText(self.listValues[3])

    def getValues(self):
        listResult = []
        listResult.append(self.txtStudentID.text())
        listResult.append(self.txtStudentFirstName.text())
        listResult.append(self.txtStudentLastName.text())
        listResult.append(self.txtStudentEmail.text())
        return listResult

if __name__ == "__main__":
    import sys
    app = QtWidgets.QApplication(sys.argv)
    Dialog = QtWidgets.QDialog()
    ui = Ui_Dialog()
    ui.setupUi(Dialog, None)
    Dialog.show()
    sys.exit(app.exec_())

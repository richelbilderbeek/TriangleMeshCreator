#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wunused-but-set-parameter"
#include "qttrianglemeshcreatormenudialog.h"

#include <QDesktopWidget>
#include <QKeyEvent>

#include "trianglemeshcreatormenudialog.h"
#include "qtaboutdialog.h"
#include "qttrianglemeshcreatormaindialog.h"
#include "qthideandshowdialog.h"
#include "ui_qttrianglemeshcreatormenudialog.h"
#pragma GCC diagnostic pop

ribi::QtTriangleMeshCreatorMenuDialog::QtTriangleMeshCreatorMenuDialog(QWidget *parent) noexcept :
    QtHideAndShowDialog(parent),
    ui(new Ui::QtTriangleMeshCreatorMenuDialog)
{
  ui->setupUi(this);
}

ribi::QtTriangleMeshCreatorMenuDialog::~QtTriangleMeshCreatorMenuDialog() noexcept
{
  delete ui;
}

void ribi::QtTriangleMeshCreatorMenuDialog::keyPressEvent(QKeyEvent * event) noexcept
{
  if (event->key() == Qt::Key_Escape) { close(); return; }
}

void ribi::QtTriangleMeshCreatorMenuDialog::on_button_about_clicked() noexcept
{
  ribi::About a = TriangleMeshCreatorMenuDialog().GetAbout();
  a.AddLibrary("QtHideAndShowDialog version: " + QtHideAndShowDialog::GetVersion());
  ribi::QtAboutDialog d(a);
  d.setWindowIcon(this->windowIcon());
  d.setStyleSheet(this->styleSheet());
  this->ShowChild(&d);
}

void ribi::QtTriangleMeshCreatorMenuDialog::on_button_quit_clicked() noexcept
{
  close();
}

void ribi::QtTriangleMeshCreatorMenuDialog::on_button_start_clicked() noexcept
{
  QtTriangleMeshCreatorMainDialog d;
  ShowChild(&d);
}

void ribi::QtTriangleMeshCreatorMenuDialog::on_button_test_clicked() noexcept
{
  TriangleMeshCreatorMenuDialog d;
  d.TestDeep();
}

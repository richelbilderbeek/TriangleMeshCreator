#ifndef QTTRIANGLEMESHCREATORMENUDIALOG_H
#define QTTRIANGLEMESHCREATORMENUDIALOG_H

#pragma GCC diagnostic push
#pragma GCC diagnostic ignored "-Weffc++"
#pragma GCC diagnostic ignored "-Wunused-local-typedefs"
#pragma GCC diagnostic ignored "-Wunused-but-set-parameter"
#include "qthideandshowdialog.h"
#pragma GCC diagnostic pop

namespace Ui {
  class QtTriangleMeshCreatorMenuDialog;
}

namespace ribi {

class QtTriangleMeshCreatorMenuDialog : public QtHideAndShowDialog
{
  Q_OBJECT

public:
  explicit QtTriangleMeshCreatorMenuDialog(QWidget *parent = 0) noexcept;
  QtTriangleMeshCreatorMenuDialog(const QtTriangleMeshCreatorMenuDialog&) = delete;
  QtTriangleMeshCreatorMenuDialog& operator=(const QtTriangleMeshCreatorMenuDialog&) = delete;
  ~QtTriangleMeshCreatorMenuDialog() noexcept;

protected:
  void keyPressEvent(QKeyEvent * event) noexcept;

private:
  Ui::QtTriangleMeshCreatorMenuDialog *ui;

private slots:
  void on_button_about_clicked() noexcept;
  void on_button_quit_clicked() noexcept;
  void on_button_start_clicked() noexcept;
  void on_button_test_clicked() noexcept;
};

} //~namespace ribi

#endif // QTTRIANGLEMESHCREATORMENUDIALOG_H

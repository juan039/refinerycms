# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Cursos" do
    describe "Admin" do
      describe "cursos", type: :feature do
        refinery_login

        describe "cursos list" do
          before do
            FactoryGirl.create(:curso, :name => "UniqueTitleOne")
            FactoryGirl.create(:curso, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.cursos_admin_cursos_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.cursos_admin_cursos_path

            click_link "Add New Curso"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              expect { click_button "Save" }.to change(Refinery::Cursos::Curso, :count).from(0).to(1)

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
            end
          end

          context "invalid data" do
            it "should fail" do
              expect { click_button "Save" }.not_to change(Refinery::Cursos::Curso, :count)

              expect(page).to have_content("Name can't be blank")
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:curso, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.cursos_admin_cursos_path

              click_link "Add New Curso"

              fill_in "Name", :with => "UniqueTitle"
              expect { click_button "Save" }.not_to change(Refinery::Cursos::Curso, :count)

              expect(page).to have_content("There were problems")
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:curso, :name => "A name") }

          it "should succeed" do
            visit refinery.cursos_admin_cursos_path

            within ".actions" do
              click_link "Edit this curso"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            expect(page).to have_content("'A different name' was successfully updated.")
            expect(page).not_to have_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:curso, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.cursos_admin_cursos_path

            click_link "Remove this curso forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Cursos::Curso.count).to eq(0)
          end
        end

      end
    end
  end
end

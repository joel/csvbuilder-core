# frozen_string_literal: true

require "spec_helper"

module Csvbuilder
  module Model
    RSpec.describe Attributes do
      describe "class" do
        let(:klass) { BasicRowModel }

        describe "::column_names" do
          subject(:column_names) { klass.column_names }

          specify { expect(column_names).to eql %i[alpha beta gamma] }
        end

        describe "::format_header" do
          subject(:format_header) { BasicRowModel.format_header(header, nil) }

          let(:header) { "user_name" }

          it "returns the header" do
            expect(format_header).to eql header
          end
        end

        describe "::headers" do
          subject(:row_model_headers) { klass.headers({ foo: :bar }) }

          let(:headers) { ["Alpha", "Beta Two", "#<OpenStruct foo=:bar> Gamma"] }

          it "returns an array with header column names" do
            expect(row_model_headers).to eql headers
          end
        end

        describe "::column_header" do
          it "returns the expected header for the given column name" do
            { alpha: "Alpha", beta: "Beta Two", gamma: "#<OpenStruct foo=:bar> Gamma" }.each do |attr, header|
              expect(klass.column_header(attr, { foo: :bar })).to eql header
            end
          end
        end

        describe "::format_cell" do
          subject(:format_cell) { BasicRowModel.format_cell(cell, nil, nil) }

          let(:cell) { "the_cell" }

          it "returns the cell" do
            expect(format_cell).to eql cell
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = prepare_user
    @book = prepare_book(@user, :one)
    @another_book = prepare_book(prepare_another_user, :two)
    sign_in_as(@user)
  end

  test 'should get index' do
    get books_url
    assert_response :success
  end

  test 'should require auth' do
    logout
    get books_url
    assert_redirected_to log_in_url(locale: 'en')
  end

  test 'should get new' do
    get new_book_url
    assert_response :success
  end

  test 'should create book' do
    assert_difference('Book.count') do
      post books_url, params: { book: { annotation: @book.annotation, authors: @book.authors, name: @book.name } }
    end

    assert_redirected_to book_url(Book.last, locale: 'en')
  end

  test 'shouldn`t create book' do
    assert_no_difference('Book.count') do
      post books_url, params: { book: { annotation: '', authors: '', name: '' } }
    end
    assert_response 422
  end

  test 'should show book' do
    get book_url(@book)
    assert_response :success
  end

  test 'shouldn`t show book' do
    get book_url(@another_book)
    assert_redirected_to books_url(locale: 'en')
  end

  test 'should get edit' do
    get edit_book_url(@book)
    assert_response :success
  end

  test 'shouldn`t get edit' do
    get edit_book_url(@another_book)
    assert_redirected_to books_url(locale: 'en')
  end

  test 'should update book' do
    patch book_url(@book), params: { book: { annotation: @book.annotation, authors: @book.authors, name: @book.name } }
    assert_redirected_to book_url(@book, locale: 'en')
  end

  test 'shouldn`t update book' do
    patch book_url(@book), params: { book: { annotation: '', authors: '', name: '' } }
    assert_response 422

    patch book_url(@another_book),
          params: { book: { annotation: @book.annotation, authors: @book.authors, name: @book.name } }
    assert_redirected_to books_url(locale: 'en')
  end

  test 'should destroy book' do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url(locale: 'en')
  end

  test 'shouldn`t destroy book' do
    assert_no_difference('Book.count', -1) do
      delete book_url(@another_book)
    end

    assert_redirected_to books_url(locale: 'en')
  end
end

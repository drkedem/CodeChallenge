require_relative '../test_helper'

class ArticleTest < ActiveSupport::TestCase
   fixtures :articles

   def test_create_article

      all_fields_article = Article.new :title => articles(:AllFieldsArticle).title,
                                       :author => articles(:AllFieldsArticle).author,
                                       :description => articles(:AllFieldsArticle).description,
                                       :tags => articles(:AllFieldsArticle).tags

      assert all_fields_article.save

      all_fields_article_copy = Article.find(all_fields_article.id)

      assert_equal all_fields_article.title, all_fields_article_copy.title
      assert_equal all_fields_article.author, all_fields_article_copy.author
      assert_equal all_fields_article.description, all_fields_article_copy.description
      assert_equal all_fields_article.tags, all_fields_article_copy.tags
      assert_not_nil all_fields_article.created_at
      assert_not_nil all_fields_article.updated_at

      no_tags_article = Article.new :title => articles(:NoTagsArticle).title,
                                    :author => articles(:NoTagsArticle).author,
                                    :description => articles(:NoTagsArticle).description,
                                    :tags => articles(:NoTagsArticle).tags

      assert no_tags_article.save

      no_tags_article_copy = Article.find(no_tags_article.id)

      assert_equal no_tags_article.title, no_tags_article_copy.title
      assert_equal no_tags_article.tags, no_tags_article_copy.tags

      no_description_article = Article.new :title => articles(:NoTagsArticle).title,
                                           :author => articles(:NoTagsArticle).author,
                                           :description => articles(:NoTagsArticle).description,
                                           :tags => articles(:NoTagsArticle).tags

      assert no_description_article.save

      no_description_article_copy = Article.find(no_description_article.id)

      assert_equal no_description_article_article.title, no_description_article_copy.title
      assert_equal no_description_article.description, no_description_article_copy.description
      assert_not_nil no_description_article.created_at
      assert_not_nil no_description_article.updated_at


      assert all_fields_article.destroy
      assert no_tags_article.destroy
      assert no_description_article.destroy

   end

   def test_create_article

      all_fields_article = Article.new :title => articles(:AllFieldsArticle).title,
                                       :author => articles(:AllFieldsArticle).author,
                                       :description => articles(:AllFieldsArticle).description,
                                       :tags => articles(:AllFieldsArticle).tags

      assert all_fields_article.save

      all_fields_article.title = "Burlington"
      assert all_fields_article.save

      all_fields_article_copy = Article.find(all_fields_article.id)

      assert_equal all_fields_article.title, all_fields_article_copy.title
      assert_equal all_fields_article.author, all_fields_article_copy.author
      assert_equal all_fields_article.description, all_fields_article_copy.description
      assert_equal all_fields_article.tags, all_fields_article_copy.tags

      assert all_fields_article.destroy
   end

end

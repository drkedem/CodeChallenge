class Body extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      articles: []
    };
    this.handleFormSubmit = this.handleFormSubmit.bind(this)
    this.addNewArticle = this.addNewArticle.bind(this)
    this.handleDelete = this.handleDelete.bind(this)
    this.deleteArticle = this.deleteArticle.bind(this)
    this.handleUpdate = this.handleUpdate.bind(this)
    this.updateArticle = this.updateArticle.bind(this)
  }
  
  handleFormSubmit(title, author, description, tags){
    let body = JSON.stringify({article: {title: title, author: author, description: description, tags: tags} })
    fetch('/api/v1/articles', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: body,
      }).then((response) => {return response.json()}).then((article)=>{
        this.addNewArticle(article)
      })      
    }
    
    addNewArticle(article){
      this.setState({
        articles: this.state.articles.concat(article)
      })
    }
    
   handleDelete(id){
    fetch(`/api/v1/articles/${id}`, 
    {
      method: 'DELETE',
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => { 
        this.deleteArticle(id)
      })
  }
  
  deleteArticle(id){
    newArticles = this.state.articles.filter((article) => article.id !== id)
    this.setState({
      articles: newArticles
    })
  }
  
  handleUpdate(article){
    fetch(`/api/v1/articles/${article.id}`, 
    {
      method: 'PUT',
      body: JSON.stringify({article: article}),
      headers: {
        'Content-Type': 'application/json'
      }
    }).then((response) => { 
        this.updateArticle(article)
      })
  }
  
  updateArticle(article){
    let newArticles = this.state.articles.filter((a) => a.id !== article.id)
    newArticles.push(article)
    this.setState({
      articles: newArticles
    })
  }

  
  componentDidMount(){
    fetch('/api/v1/articles.json')
      .then((response) => {return response.json()})
      .then((data) => {this.setState({ articles: data }) });
  }
  
  render(){
      return(
        <div>
          <h1><u>Add a new article</u></h1>
          <NewArticle handleFormSubmit={this.handleFormSubmit}/>
          <h1><u>Articles</u></h1>
          <AllArticles articles={this.state.articles} handleDelete = {this.handleDelete} handleUpdate = {this.handleUpdate} />
        </div>
      )
    }
}
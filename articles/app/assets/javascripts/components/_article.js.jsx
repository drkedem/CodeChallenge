class Article extends React.Component{

  constructor(props){
    super(props);
    this.state = {
      editable: false
    }
    this.handleEdit = this.handleEdit.bind(this)
  }

  handleEdit(){
    if(this.state.editable){
      let title = this.title.value
      let author = this.author.value
      let description = this.description.value
      let tags = this.tags.value
      let id = this.props.article.id
      let article = {id: id, title: title, author: author, description: description, tags: tags}
      this.props.handleUpdate(article)
    }
    this.setState({
      editable: !this.state.editable
    })
  }

  render(){
    editable = this.state.editable
    let title = editable ? <input type='text' ref={input => this.title = input} defaultValue={this.props.article.title}/>:<h3>Title: {this.props.article.title}</h3>
    let author = editable ? <input type='text' ref={input => this.author = input} defaultValue={this.props.article.author}/>:<h3>Author: {this.props.article.author}</h3>
    let tags = editable ? <input type='text' ref={input => this.tags = input} defaultValue={this.props.article.tags}/>:<p>Tags: {this.props.article.tags}</p>
    let description = editable ? <input type='text' ref={input => this.description = input} defaultValue={this.props.article.description}/>:<p>Description: {this.props.article.description}</p>
    let editButton = <button onClick={() => this.handleEdit()}>{editable? 'Submit' : 'Edit'}</button>
    let deleteButton = editable ? "" : <button onClick={() => this.props.handleDelete(this.props.article.id)}>Delete</button>
    return(
        <div>
          {title}
          {author}
          {tags}
          {description}
          {editButton}
          {deleteButton}
        </div>
    )
  }
}
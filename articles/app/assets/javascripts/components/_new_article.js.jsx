const NewArticle = (props) => {
    let formFields = {}

    return(
        <form onSubmit={ (e) => { props.handleFormSubmit(formFields.title.value, formFields.author.value, formFields.description.value, formFields.tags.value); e.target.reset();} }>
            <input ref={input => formFields.title = input} placeholder='Enter the title of the article'/>
            <input ref={input => formFields.author = input} placeholder='Enter the author'/>
            <input ref={input => formFields.description = input} placeholder='Enter a description' />
            <input ref={input => formFields.tags = input} placeholder='Enter tags' />
            <button>Submit</button>
        </form>
    )
}
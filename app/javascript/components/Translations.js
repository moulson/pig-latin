import React from 'react'

class Translations extends React.Component{

    state = {data: this.props.initialData};

    loadTranslationsFromServer = () => {
        var xhr = new XMLHttpRequest();
        xhr.open('get', 'translations.json', true);
        xhr.onload = () => {
            console.log(this.state.data);
            this.setState({
                data: ["test"]
            });
            console.log(this.state.data);
        };
        xhr.send();
    };
    
    handleTranslationSubmit = translation => {
        translation.id = Date.now();
        this.setState({data: translation});
        var data = new FormData();
        data.append('translation[input]', translation.input);

        var xhr = new XMLHttpRequest();
        xhr.open('post', '/translations.json', true)
        xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))
        xhr.onload = function(){
            this.loadTranslationsFromServer();
        }.bind(this);
        xhr.send(data);
    }

    componentDidMount(){
        this.loadTranslationsFromServer
    }

    render(){
        return(
            <div className="translations">
                <TranslationsTable data={this.state.data} />
                <TranslationForm onTranslationSubmit={this.handleTranslationSubmit}/>
            </div>
        );
    }
}

class TranslationsTable extends React.Component{
    render(){
        var translations = this.props.data.map(function(translation){
            return(
                <Translation input={translation.input} output={translation.output} id={translation.id} key={translation.id} />
            );
        })
        return (
            <table className="table table-striped">
                <thead>
                    <tr>
                        <th>Original</th>
                        <th>Translated</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    {translations}
                </tbody>
            </table>
        );
    }
}

class TranslationForm extends React.Component{
    state = {
        input: ''
    };

    handleInputChange = e => {
        this.setState({input: e.target.value});
    }

    handleSubmit = e => {
        e.preventDefault();
        var input = this.state.input.trim();
        if(!input){
            return;
        }
        this.props.onTranslationSubmit({input: input});
        this.setState({input: ''});
    };
    render(){
        return(
            <form 
                acceptCharset="UTF-8"
                onSubmit={this.handleSubmit}
            >
                <input
                    type="text"
                    className="form-control"
                    name="translation[input]"
                    onChange={this.handleInputChange}
                />
                <input
                    type="submit"
                    className="btn btn-primary"
                    value="Add Translation"
                />
            </form>
        );
    }
}

class Translation extends React.Component{
    render(){
        return(
            <tr>
                <td>{this.props.input}</td>
                <td>{this.props.output}</td>
                <td>
                    <div className="btn-group">
                        <a href={`/translations/${this.props.id}`} className="btn btn-default">Show</a>
                        <a href={`/translations/${this.props.id}/edit`} className="btn btn-default">Edit</a>
                        <a 
                            href={`/translations/${this.props.id}`} 
                            className="btn btn-danger"
                            rel="nofollow"
                            data-confirm="Are you sure?"
                            data-method="delete"
                        >
                            Delete
                        </a>
                    </div>
                </td>
            </tr>
        )
    }
}  

export default Translations;
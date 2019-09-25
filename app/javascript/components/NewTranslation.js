import React from 'react';

class NewTranslation extends React.Component{
    constructor(props){
        super(props);
        this.state = {
            input: props.translation.input,
            output: props.translation.output
        };
        this.handleInputChange = this.handleInputChange.bind(this)
        this.handleSubmit = this.handleSubmit.bind(this)
    }

    handleInputChange(e){
        this.setState({input: e.target.value})
    }
    handleSubmit(e){
        e.preventDefault;
    }
    render(){
        return(
            <div>
                <label>Text to translate</label>
                <input
                    className="form-control"
                    type="text"
                    name="translation[input]"
                    value={this.state.input}
                    onChange={this.handleInputChange}
                />
                <input type="submit" value="Add Translation" className="btn btn-primary" />
            </div>
        );
    }
}

export default NewTranslation;
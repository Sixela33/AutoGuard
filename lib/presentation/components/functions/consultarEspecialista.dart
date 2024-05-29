import 'package:dart_openai/dart_openai.dart';

Future<void> consultarEspecialista (String inputUsuario) async {
    
    final systemMessage = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.system, 
      content: [OpenAIChatCompletionChoiceMessageContentItemModel.text('Solo puedes decir la palabra "perro" ')]);

    final userMessage = OpenAIChatCompletionChoiceMessageModel(
      role: OpenAIChatMessageRole.user,
      content: [OpenAIChatCompletionChoiceMessageContentItemModel.text(inputUsuario)]
      );

    final requestMessages = [
      systemMessage,
      userMessage
    ];

    String presentacion = "Es muy importante que respondas con una sola palabra y solo usando las especialidades que se listan a continuación. Eres la recepcionista de una Clínica u Hospital. La institución cuenta únicamente con especialistas en las siguientes especialidades médicas: ";
    String especialidades = "Clínico, Traumatólogo, Cardiólogo, Dentista, Dermatólogo.";
    String paciente = " Razón del paciente para buscar consulta médica: ";
    String fin = "Solo puedes responder con el nombre de la especialidad que se especifica en este prompt. Si la respuesta no se encuentra en este prompt, responde: Especialidad no disponible.";
    String prompt = presentacion + especialidades + paciente + inputUsuario + fin;

    OpenAICompletionModel completion = await OpenAI.instance.completion.create(
      model: 'gpt-3.5-turbo-instruct',
      prompt: prompt,
      maxTokens: 20
    );

    print(completion.choices.first.text); // ...
    print(completion.systemFingerprint); // ...
    print(completion.id); 
    }
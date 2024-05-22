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

    OpenAIChatCompletionModel completion = await OpenAI.instance.chat.create(
      model: 'gpt-3.5-turbo-1106',
      messages: requestMessages,
      maxTokens: 500
    );

    print(completion.choices.first.message);
    print(completion.systemFingerprint);
    print(completion.usage.promptTokens); 
    print(completion.id);
    }
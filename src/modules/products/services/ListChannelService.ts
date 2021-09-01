import { getCustomRepository } from 'typeorm';
import Channel from '../typeorm/entities/Channel';
import { ChannelRepository } from '../typeorm/repositories/ChannelRepository';

class ListChannelService {
  public async execute(): Promise<Channel[]> {
    const channelRepository = getCustomRepository(ChannelRepository);

    const channel = await channelRepository.find();

    return channel;
  }
}

export default ListChannelService;
